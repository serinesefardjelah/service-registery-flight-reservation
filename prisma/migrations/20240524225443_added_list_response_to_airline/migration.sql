-- RedefineTables
PRAGMA foreign_keys=OFF;
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
    "airlineId" INTEGER,
    CONSTRAINT "ResponseMapping_endpointId_fkey" FOREIGN KEY ("endpointId") REFERENCES "Endpoint" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ResponseMapping_paramsId_fkey" FOREIGN KEY ("paramsId") REFERENCES "Params" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "ResponseMapping_airlineId_fkey" FOREIGN KEY ("airlineId") REFERENCES "Airline" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_ResponseMapping" ("arrival", "arrival_date", "classe", "departure", "departure_date", "endpointId", "id", "paramsId", "price") SELECT "arrival", "arrival_date", "classe", "departure", "departure_date", "endpointId", "id", "paramsId", "price" FROM "ResponseMapping";
DROP TABLE "ResponseMapping";
ALTER TABLE "new_ResponseMapping" RENAME TO "ResponseMapping";
PRAGMA foreign_key_check("ResponseMapping");
PRAGMA foreign_keys=ON;
