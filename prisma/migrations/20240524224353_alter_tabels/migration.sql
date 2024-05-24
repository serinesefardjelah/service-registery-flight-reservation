/*
  Warnings:

  - You are about to drop the column `paramsId` on the `Mapping` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Mapping" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "endpointId" INTEGER NOT NULL,
    "departure" TEXT NOT NULL,
    "arrival" TEXT NOT NULL,
    "depature_date" TEXT NOT NULL,
    "arrival_date" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "price" REAL NOT NULL,
    CONSTRAINT "Mapping_endpointId_fkey" FOREIGN KEY ("endpointId") REFERENCES "Endpoint" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Mapping" ("arrival", "arrival_date", "class", "departure", "depature_date", "endpointId", "id", "price") SELECT "arrival", "arrival_date", "class", "departure", "depature_date", "endpointId", "id", "price" FROM "Mapping";
DROP TABLE "Mapping";
ALTER TABLE "new_Mapping" RENAME TO "Mapping";
CREATE TABLE "new_ResponseMapping" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "endpointId" INTEGER NOT NULL,
    "departure" TEXT NOT NULL,
    "arrival" TEXT NOT NULL,
    "departure_date" DATETIME NOT NULL,
    "arrival_date" DATETIME NOT NULL,
    "classe" TEXT NOT NULL,
    "price" REAL NOT NULL,
    "paramsId" INTEGER,
    CONSTRAINT "ResponseMapping_endpointId_fkey" FOREIGN KEY ("endpointId") REFERENCES "Endpoint" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ResponseMapping_paramsId_fkey" FOREIGN KEY ("paramsId") REFERENCES "Params" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_ResponseMapping" ("arrival", "arrival_date", "classe", "departure", "departure_date", "endpointId", "id", "paramsId", "price") SELECT "arrival", "arrival_date", "classe", "departure", "departure_date", "endpointId", "id", "paramsId", "price" FROM "ResponseMapping";
DROP TABLE "ResponseMapping";
ALTER TABLE "new_ResponseMapping" RENAME TO "ResponseMapping";
PRAGMA foreign_key_check("Mapping");
PRAGMA foreign_key_check("ResponseMapping");
PRAGMA foreign_keys=ON;
