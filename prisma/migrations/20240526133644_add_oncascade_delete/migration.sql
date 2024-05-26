-- DropForeignKey
ALTER TABLE "ResponseMapping" DROP CONSTRAINT "ResponseMapping_endpointId_fkey";

-- DropForeignKey
ALTER TABLE "ResponseMapping" DROP CONSTRAINT "ResponseMapping_paramsId_fkey";

-- AddForeignKey
ALTER TABLE "ResponseMapping" ADD CONSTRAINT "ResponseMapping_endpointId_fkey" FOREIGN KEY ("endpointId") REFERENCES "Endpoint"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ResponseMapping" ADD CONSTRAINT "ResponseMapping_paramsId_fkey" FOREIGN KEY ("paramsId") REFERENCES "Params"("id") ON DELETE CASCADE ON UPDATE CASCADE;
