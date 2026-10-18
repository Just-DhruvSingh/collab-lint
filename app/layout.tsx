import "./globals.css";
import type { Metadata } from "next";
export const metadata: Metadata = { title: "CollabLint", description: "Feasibility checks for campus collaborations" };
export default function Layout({ children }: { children: React.ReactNode }) { return <html lang="en"><body>{children}</body></html>; }
