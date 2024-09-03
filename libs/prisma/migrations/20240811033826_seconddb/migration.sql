/*
  Warnings:

  - Added the required column `amount` to the `Transaction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `createdAt` to the `Transaction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `direction` to the `Transaction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `targetAddress` to the `Transaction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `timestamp` to the `Transaction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `transactionHash` to the `Transaction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Transaction` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "DIRECTION" AS ENUM ('SEND', 'RECEIVE');

-- AlterTable
ALTER TABLE "Transaction" ADD COLUMN     "amount" TEXT NOT NULL,
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "direction" "DIRECTION" NOT NULL,
ADD COLUMN     "targetAddress" TEXT NOT NULL,
ADD COLUMN     "timestamp" INTEGER NOT NULL,
ADD COLUMN     "transactionHash" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;
