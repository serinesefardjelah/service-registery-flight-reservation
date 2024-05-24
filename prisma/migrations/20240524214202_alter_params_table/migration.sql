/*
  Warnings:

  - You are about to drop the column `value` on the `Params` table. All the data in the column will be lost.
  - Added the required column `arrival` to the `Params` table without a default value. This is not possible if the table is not empty.
  - Added the required column `arrival_date` to the `Params` table without a default value. This is not possible if the table is not empty.
  - Added the required column `class` to the `Params` table without a default value. This is not possible if the table is not empty.
  - Added the required column `departure` to the `Params` table without a default value. This is not possible if the table is not empty.
  - Added the required column `price` to the `Params` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Mapping" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "endpointId" INTEGER NOT NULL,
    "paramsId" INTEGER NOT NULL,
    "departure" TEXT NOT NULL,
    "arrival" TEXT NOT NULL,
    "depature_date" TEXT NOT NULL,
    "arrival_date" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "price" REAL NOT NULL,
    CONSTRAINT "Mapping_endpointId_fkey" FOREIGN KEY ("endpointId") REFERENCES "Endpoint" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Mapping_paramsId_fkey" FOREIGN KEY ("paramsId") REFERENCES "Params" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Mapping" ("arrival", "arrival_date", "class", "departure", "depature_date", "endpointId", "id", "paramsId", "price") SELECT "arrival", "arrival_date", "class", "departure", "depature_date", "endpointId", "id", "paramsId", "price" FROM "Mapping";
DROP TABLE "Mapping";
ALTER TABLE "new_Mapping" RENAME TO "Mapping";
CREATE TABLE "new_Params" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "deprature_date" TEXT NOT NULL,
    "arrival_date" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "price" REAL NOT NULL,
    "departure" TEXT NOT NULL,
    "arrival" TEXT NOT NULL,
    "endpointId" INTEGER NOT NULL,
    CONSTRAINT "Params_endpointId_fkey" FOREIGN KEY ("endpointId") REFERENCES "Endpoint" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Params" ("deprature_date", "endpointId", "id") SELECT "deprature_date", "endpointId", "id" FROM "Params";
DROP TABLE "Params";
ALTER TABLE "new_Params" RENAME TO "Params";
PRAGMA foreign_key_check("Mapping");
PRAGMA foreign_key_check("Params");
PRAGMA foreign_keys=ON;
