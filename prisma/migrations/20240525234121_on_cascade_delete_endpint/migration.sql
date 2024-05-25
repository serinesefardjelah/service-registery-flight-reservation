-- DropForeignKey
ALTER TABLE "Params" DROP CONSTRAINT "Params_endpointId_fkey";

-- AddForeignKey
ALTER TABLE "Params" ADD CONSTRAINT "Params_endpointId_fkey" FOREIGN KEY ("endpointId") REFERENCES "Endpoint"("id") ON DELETE CASCADE ON UPDATE CASCADE;
