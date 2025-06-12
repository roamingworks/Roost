import mongoose, { Document, Schema } from "mongoose";

export interface IPayment extends Document {
  type: "hostel" | "water" | "electricity";
  amount: number;
  status: "pending" | "paid" | "approved";
  photo?: string;
  student: mongoose.Types.ObjectId;
  createdAt: Date;
}

const paymentSchema = new Schema<IPayment>({
  type: {
    type: String,
    enum: ["hostel", "water", "electricity"],
    required: true,
  },
  amount: { type: Number, required: true },
  status: {
    type: String,
    enum: ["pending", "paid", "approved"],
    default: "pending",
  },
  photo: String,
  student: { type: Schema.Types.ObjectId, ref: "User", required: true },
  createdAt: { type: Date, default: Date.now },
});

export const Payment = mongoose.model<IPayment>("Payment", paymentSchema);
