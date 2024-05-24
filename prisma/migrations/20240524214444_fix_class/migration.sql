/*
  Warnings:

  - You are about to drop the column `class` on the `Params` table. All the data in the column will be lost.
  - Added the required column `classe` to the `Params` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Params" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "departure_date" TEXT NOT NULL,
    "arrival_date" TEXT NOT NULL,
    "classe" TEXT NOT NULL,
    "price" REAL NOT NULL,
    "departure" TEXT NOT NULL,
    "arrival" TEXT NOT NULL,
    "endpointId" INTEGER NOT NULL,
    CONSTRAINT "Params_endpointId_fkey" FOREIGN KEY ("endpointId") REFERENCES "Endpoint" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Params" ("arrival", "arrival_date", "departure", "departure_date", "endpointId", "id", "price") SELECT "arrival", "arrival_date", "departure", "departure_date", "endpointId", "id", "price" FROM "Params";
DROP TABLE "Params";
ALTER TABLE "new_Params" RENAME TO "Params";
PRAGMA foreign_key_check("Params");
PRAGMA foreign_keys=ON;
