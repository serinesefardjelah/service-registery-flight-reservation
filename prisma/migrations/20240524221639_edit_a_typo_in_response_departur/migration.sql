/*
  Warnings:

  - You are about to drop the column `class` on the `ResponseMapping` table. All the data in the column will be lost.
  - You are about to drop the column `depature_date` on the `ResponseMapping` table. All the data in the column will be lost.
  - Added the required column `classe` to the `ResponseMapping` table without a default value. This is not possible if the table is not empty.
  - Added the required column `departure_date` to the `ResponseMapping` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_ResponseMapping" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "endpointId" INTEGER NOT NULL,
    "paramsId" INTEGER NOT NULL,
    "departure" TEXT NOT NULL,
    "arrival" TEXT NOT NULL,
    "departure_date" DATETIME NOT NULL,
    "arrival_date" DATETIME NOT NULL,
    "classe" TEXT NOT NULL,
    "price" REAL NOT NULL,
    CONSTRAINT "ResponseMapping_endpointId_fkey" FOREIGN KEY ("endpointId") REFERENCES "Endpoint" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ResponseMapping_paramsId_fkey" FOREIGN KEY ("paramsId") REFERENCES "Params" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_ResponseMapping" ("arrival", "arrival_date", "departure", "endpointId", "id", "paramsId", "price") SELECT "arrival", "arrival_date", "departure", "endpointId", "id", "paramsId", "price" FROM "ResponseMapping";
DROP TABLE "ResponseMapping";
ALTER TABLE "new_ResponseMapping" RENAME TO "ResponseMapping";
PRAGMA foreign_key_check("ResponseMapping");
PRAGMA foreign_keys=ON;
