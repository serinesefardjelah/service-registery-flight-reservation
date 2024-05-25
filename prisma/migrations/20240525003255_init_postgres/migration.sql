-- CreateTable
CREATE TABLE "Airline" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "baseURL" TEXT NOT NULL,

    CONSTRAINT "Airline_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Endpoint" (
    "id" SERIAL NOT NULL,
    "path" TEXT NOT NULL,
    "airlineId" INTEGER NOT NULL,

    CONSTRAINT "Endpoint_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Params" (
    "id" SERIAL NOT NULL,
    "departure_date" TEXT NOT NULL,
    "arrival_date" TEXT NOT NULL,
    "classe" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "departure" TEXT NOT NULL,
    "arrival" TEXT NOT NULL,
    "endpointId" INTEGER NOT NULL,

    CONSTRAINT "Params_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ResponseMapping" (
    "id" SERIAL NOT NULL,
    "endpointId" INTEGER NOT NULL,
    "departure" TEXT NOT NULL,
    "arrival" TEXT NOT NULL,
    "departure_date" TIMESTAMP(3) NOT NULL,
    "arrival_date" TIMESTAMP(3) NOT NULL,
    "classe" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "description" TEXT NOT NULL,
    "paramsId" INTEGER,

    CONSTRAINT "ResponseMapping_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Endpoint" ADD CONSTRAINT "Endpoint_airlineId_fkey" FOREIGN KEY ("airlineId") REFERENCES "Airline"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Params" ADD CONSTRAINT "Params_endpointId_fkey" FOREIGN KEY ("endpointId") REFERENCES "Endpoint"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ResponseMapping" ADD CONSTRAINT "ResponseMapping_endpointId_fkey" FOREIGN KEY ("endpointId") REFERENCES "Endpoint"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ResponseMapping" ADD CONSTRAINT "ResponseMapping_paramsId_fkey" FOREIGN KEY ("paramsId") REFERENCES "Params"("id") ON DELETE SET NULL ON UPDATE CASCADE;
