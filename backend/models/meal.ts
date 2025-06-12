import mongoose, { Document, Schema } from "mongoose";

export interface IMeal extends Document {
  date: Date;
  breakfast: string;
  lunch: string;
  teaSnacks: string;
  dinner: string;
  status: {
    breakfast: boolean;
    lunch: boolean;
    teaSnacks: boolean;
    dinner: boolean;
  };
  student: mongoose.Types.ObjectId;
}

const mealSchema = new Schema<IMeal>({
  date: { type: Date, required: true },
  breakfast: String,
  lunch: String,
  teaSnacks: String,
  dinner: String,
  status: {
    breakfast: { type: Boolean, default: false },
    lunch: { type: Boolean, default: false },
    teaSnacks: { type: Boolean, default: false },
    dinner: { type: Boolean, default: false },
  },
  student: { type: Schema.Types.ObjectId, ref: "User", required: true },
});

export const Meal = mongoose.model<IMeal>("Meal", mealSchema);
