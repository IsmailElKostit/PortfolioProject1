--Covid 19 Data Exploration 

--Select *
--From CoronaProject..CovidDeaths
--Where continent is not null 
--order by 3,4

--Select Location, date, total_cases, new_cases, total_deaths, population
--From CoronaProject..CovidDeaths
--Where continent is not null 
--order by 1,2

-- Shows likelihood of dying if you contract covid in France

--Select Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
--From CoronaProject..CovidDeaths
--Where location like 'France'
--and continent is not null 
--order by 1,2

-- Countries with Highest Infection Rate compared to Population

--Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
--From CoronaProject..CovidDeaths
--Group by Location, Population
--order by PercentPopulationInfected desc


-- Countries with Highest Death Count per Population

--Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
--From CoronaProject..CovidDeaths
--Where continent is not null 
--Group by Location
--order by TotalDeathCount desc

--Table 1 GLOBAL NUMBERS

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases) as DeathPercentage
From CoronaProject..CovidDeaths
where continent is not null 
order by 1,2


--Table 2 Continents with Highest Death Count per Population

Select Location,continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From CoronaProject..CovidDeaths
Where continent is not null 
Group by Location,continent
order by TotalDeathCount desc


--Table 3 Countries with Highest Infection Rate compared to Population 

WITH InfectionRates AS (
SELECT Location, Population, MAX(total_cases) AS HighestInfectionCount,  MAX((total_cases/population)) AS PercentPopulationInfected
FROM CoronaProject..CovidDeaths
GROUP BY Location, Population
)
SELECT TOP 10 Location, Population, HighestInfectionCount, PercentPopulationInfected
FROM InfectionRates
ORDER BY PercentPopulationInfected DESC;


--Table 4 Total Cases Over Time per continent
SELECT continent, location, date, SUM(total_cases) as Total_cases_per_day
FROM CoronaProject..CovidDeaths
where continent is not null
group by continent, location, date
order by continent, location, date

-- Shows Percentage of Population that has recieved at least one Covid Vaccine

--Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
--, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
----, (RollingPeopleVaccinated/population)*100
--From CoronaProject..CovidDeaths dea
--Join CoronaProject..CovidVaccinations vac
--	On dea.location = vac.location
--	and dea.date = vac.date
--where dea.continent is not null 
--order by 2,3
