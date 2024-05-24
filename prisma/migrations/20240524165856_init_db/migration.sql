-- CreateTable
CREATE TABLE "Airline" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "baseUrl" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Endpoint" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "url" TEXT NOT NULL,
    "airlineId" INTEGER NOT NULL,
    CONSTRAINT "Endpoint_airlineId_fkey" FOREIGN KEY ("airlineId") REFERENCES "Airline" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Params" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "deprature_date" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "endpointId" INTEGER NOT NULL,
    CONSTRAINT "Params_endpointId_fkey" FOREIGN KEY ("endpointId") REFERENCES "Endpoint" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Mapping" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "endpointId" INTEGER NOT NULL,
    "paramsId" INTEGER NOT NULL,
    "departure" TEXT NOT NULL,
    "arrival" TEXT NOT NULL,
    "depature_date" DATETIME NOT NULL,
    "arrival_date" DATETIME NOT NULL,
    "class" TEXT NOT NULL,
    "price" REAL NOT NULL,
    CONSTRAINT "Mapping_endpointId_fkey" FOREIGN KEY ("endpointId") REFERENCES "Endpoint" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Mapping_paramsId_fkey" FOREIGN KEY ("paramsId") REFERENCES "Params" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ResponseMapping" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "endpointId" INTEGER NOT NULL,
    "paramsId" INTEGER NOT NULL,
    "departure" TEXT NOT NULL,
    "arrival" TEXT NOT NULL,
    "depature_date" DATETIME NOT NULL,
    "arrival_date" DATETIME NOT NULL,
    "class" TEXT NOT NULL,
    "price" REAL NOT NULL,
    CONSTRAINT "ResponseMapping_endpointId_fkey" FOREIGN KEY ("endpointId") REFERENCES "Endpoint" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ResponseMapping_paramsId_fkey" FOREIGN KEY ("paramsId") REFERENCES "Params" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
