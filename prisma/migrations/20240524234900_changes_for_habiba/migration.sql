/*
  Warnings:

  - You are about to drop the `Mapping` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the column `url` on the `Endpoint` table. All the data in the column will be lost.
  - You are about to drop the column `airlineId` on the `ResponseMapping` table. All the data in the column will be lost.
  - You are about to drop the column `baseUrl` on the `Airline` table. All the data in the column will be lost.
  - Added the required column `path` to the `Endpoint` table without a default value. This is not possible if the table is not empty.
  - Added the required column `description` to the `ResponseMapping` table without a default value. This is not possible if the table is not empty.
  - Added the required column `baseURL` to the `Airline` table without a default value. This is not possible if the table is not empty.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Mapping";
PRAGMA foreign_keys=on;

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Endpoint" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "path" TEXT NOT NULL,
    "airlineId" INTEGER NOT NULL,
    CONSTRAINT "Endpoint_airlineId_fkey" FOREIGN KEY ("airlineId") REFERENCES "Airline" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Endpoint" ("airlineId", "id") SELECT "airlineId", "id" FROM "Endpoint";
DROP TABLE "Endpoint";
ALTER TABLE "new_Endpoint" RENAME TO "Endpoint";
CREATE TABLE "new_ResponseMapping" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "endpointId" INTEGER NOT NULL,
    "departure" TEXT NOT NULL,
    "arrival" TEXT NOT NULL,
    "departure_date" DATETIME NOT NULL,
    "arrival_date" DATETIME NOT NULL,
    "classe" TEXT NOT NULL,
    "price" REAL NOT NULL,
    "description" TEXT NOT NULL,
    "paramsId" INTEGER,
    CONSTRAINT "ResponseMapping_endpointId_fkey" FOREIGN KEY ("endpointId") REFERENCES "Endpoint" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ResponseMapping_paramsId_fkey" FOREIGN KEY ("paramsId") REFERENCES "Params" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_ResponseMapping" ("arrival", "arrival_date", "classe", "departure", "departure_date", "endpointId", "id", "paramsId", "price") SELECT "arrival", "arrival_date", "classe", "departure", "departure_date", "endpointId", "id", "paramsId", "price" FROM "ResponseMapping";
DROP TABLE "ResponseMapping";
ALTER TABLE "new_ResponseMapping" RENAME TO "ResponseMapping";
CREATE TABLE "new_Airline" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "baseURL" TEXT NOT NULL
);
INSERT INTO "new_Airline" ("id", "name") SELECT "id", "name" FROM "Airline";
DROP TABLE "Airline";
ALTER TABLE "new_Airline" RENAME TO "Airline";
PRAGMA foreign_key_check("Endpoint");
PRAGMA foreign_key_check("ResponseMapping");
PRAGMA foreign_key_check("Airline");
PRAGMA foreign_keys=ON;
