/*1.Quantitat de registres de la taula de vols.*/
select count(*) as "total" from Flights;

/*2.Retard promig de sortida i arribada segons l’aeroport origen.*/
select Origin, avg(ArrDelay) as "prom_arribades", avg(DepDelay) as "prom_sortides" from Flights group by Origin;

/*3.Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen.*/
select Origin, colYear, colMonth, avg(ArrDelay) as "prom_arribades" from Flights 
group by Origin, colYear, colMonth;

/*4.Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen (mateixa consulta que abans i amb el mateix ordre). Però a més, ara volen que en comptes del codi de l’aeroport es mostri el nom de la ciutat.*/
select a.City, f.colYear, f.colMonth, avg(f.ArrDelay) as "prom_arribades" 
from USAirports a join Flights f on a.IATA=f.Origin 
group by a.City, f.colYear, f.colMonth;

/*5.Les companyies amb més vols cancelats, per mesos i any. A més, han d’estar ordenades de forma que les companyies amb més cancel·lacions apareguin les primeres.*/
select UniqueCarrier, colYear, colMonth, avg(ArrDelay) as "avg_delay", sum(Cancelled) as "total_cancelled" 
from Flights group by UniqueCarrier, colYear, colMonth order by total_cancelled desc;

/*6.L’identificador dels 10 avions que més distància han recorregut fent vols.*/
select TailNum, sum(Distance) as "totalDistance" 
from Flights group by TailNum order by totalDistance desc
LIMIT 1, 10;

/*7.Companyies amb el seu retard promig només d’aquelles les quals els seus vols arriben al seu destí amb un retràs promig major de 10 minuts.*/
select UniqueCarrier, avg(ArrDelay) as "avgDelay" 
from Flights group by UniqueCarrier having AvgDelay > 10
order by avgDelay desc;