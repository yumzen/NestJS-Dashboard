/*
  Warnings:

  - You are about to drop the column `assetId` on the `Transaction` table. All the data in the column will be lost.
  - You are about to alter the column `targetAddress` on the `Transaction` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(42)`.
  - You are about to alter the column `transactionHash` on the `Transaction` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(66)`.
  - A unique constraint covering the columns `[transactionHash,targetAddress]` on the table `Transaction` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `address` to the `Transaction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `Transaction` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "ACTIVE_STATUS" AS ENUM ('ACTIVE', 'INACTIVE');

-- DropForeignKey
ALTER TABLE "Transaction" DROP CONSTRAINT "Transaction_assetId_fkey";

-- AlterTable
ALTER TABLE "Transaction" DROP COLUMN "assetId",
ADD COLUMN     "address" VARCHAR(42) NOT NULL,
ADD COLUMN     "userId" TEXT NOT NULL,
ALTER COLUMN "createdAt" SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "targetAddress" SET DATA TYPE VARCHAR(42),
ALTER COLUMN "transactionHash" SET DATA TYPE VARCHAR(66);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "address" VARCHAR(42) NOT NULL,
    "lastUpdatedBlockNumber" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserAssetBalance" (
    "userId" TEXT NOT NULL,
    "assetId" TEXT NOT NULL,
    "balance" TEXT NOT NULL,
    "status" "ACTIVE_STATUS" NOT NULL DEFAULT 'ACTIVE',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "UserAssetBalance_pkey" PRIMARY KEY ("userId","assetId")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_address_key" ON "User"("address");

-- CreateIndex
CREATE UNIQUE INDEX "Transaction_transactionHash_targetAddress_key" ON "Transaction"("transactionHash", "targetAddress");

-- AddForeignKey
ALTER TABLE "UserAssetBalance" ADD CONSTRAINT "UserAssetBalance_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserAssetBalance" ADD CONSTRAINT "UserAssetBalance_assetId_fkey" FOREIGN KEY ("assetId") REFERENCES "Asset"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_address_fkey" FOREIGN KEY ("address") REFERENCES "Asset"("address") ON DELETE RESTRICT ON UPDATE CASCADE;
