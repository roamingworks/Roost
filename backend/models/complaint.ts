// models/Complaint.ts
import mongoose, { Document, Schema } from "mongoose";

export interface IComplaint extends Document {
  title: string;
  description: string;
  image?: string;
  status: "pending" | "resolved";
  student: mongoose.Types.ObjectId;
  createdAt: Date;
  adminViewed: boolean;
}

const complaintSchema = new Schema<IComplaint>({
  title: { type: String, required: true },
  description: { type: String, required: true },
  image: String,
  status: { type: String, enum: ["pending", "resolved"], default: "pending" },
  student: { type: Schema.Types.ObjectId, ref: "User", required: true },
  createdAt: { type: Date, default: Date.now },
  adminViewed: { type: Boolean, default: false },
});

export const Complaint = mongoose.model<IComplaint>(
  "Complaint",
  complaintSchema,
);
