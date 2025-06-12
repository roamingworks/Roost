import { Request, Response, NextFunction } from "express";
import jwt from "jsonwebtoken";

export interface AuthenticatedRequest extends Request {
  userId?: string;
  userRole?: string;
}

export const auth = (
  req: AuthenticatedRequest,
  res: Response,
  next: NextFunction,
): void => {
  try {
    // Check authorization header exists
    const authHeader = req.headers.authorization;
    if (!authHeader) {
      res.status(401).json({ error: "Authorization header missing" });
      return;
    }

    // Extract token
    const token = authHeader.split(" ")[1];
    if (!token) {
      res.status(401).json({ error: "Token missing" });
      return;
    }

    // Verify JWT_SECRET exists
    if (!process.env.JWT_SECRET) {
      throw new Error("JWT_SECRET not configured");
    }

    // Verify token
    const decoded = jwt.verify(token, process.env.JWT_SECRET) as {
      userId: string;
      role: string;
    };

    // Attach user info to request
    req.userId = decoded.userId;
    req.userRole = decoded.role;

    // Continue to next middleware
    next();
  } catch (error) {
    // Handle different error cases
    if (error instanceof jwt.TokenExpiredError) {
      res.status(401).json({ error: "Token expired" });
    } else if (error instanceof jwt.JsonWebTokenError) {
      res.status(401).json({ error: "Invalid token" });
    } else {
      console.error("Authentication error:", error);
      res.status(500).json({ error: "Authentication failed" });
    }
  }
};
