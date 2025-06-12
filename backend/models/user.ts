// models/User.ts
import mongoose, { Document, Schema } from "mongoose";

export interface IUser extends Document {
  username: string;
  password: string;
  role: "student" | "admin";
  studentDetails?: IStudent;
}

export interface IStudent {
  name: string;
  phone: string;
  parentPhone: string;
  address: string;
  branch: string;
  hostel: string;
  roomNo: string;
  photo?: string;
}

const userSchema = new Schema<IUser>({
  username: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  role: { type: String, enum: ["student", "admin"], required: true },
  studentDetails: {
    name: String,
    phone: String,
    parentPhone: String,
    address: String,
    branch: String,
    hostel: String,
    roomNo: String,
    photo: String,
  },
});

export const User = mongoose.model<IUser>("User", userSchema);
