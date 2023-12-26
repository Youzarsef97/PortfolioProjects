select* from PortfolioProject..[Nashville Housing]
---------------------------------------------------------------
select SaledateConverted,convert(date,SaleDate)
from PortfolioProject..[Nashville Housing]

update [Nashville Housing]
set SaleDate =convert(date,SaleDate)

Alter Table [Nashville Housing]
Add SaledateConverted Date;
update [Nashville Housing]
set SaledateConverted =convert(date,SaleDate)



------------------------------------------------------------

select *
from PortfolioProject..[Nashville Housing]
 --where PropertyAddress is null
 order by ParcelID

 select a.ParcelID, a.PropertyAddress,b.ParcelID,b.PropertyAddress,ISNULL(a.PropertyAddress,b.PropertyAddress)
 from PortfolioProject..[Nashville Housing] a
 join PortfolioProject..[Nashville Housing] b
	on a.ParcelID=b.ParcelID
	and a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null

update a
set PropertyAddress =ISNULL(a.PropertyAddress,b.PropertyAddress)
 from PortfolioProject..[Nashville Housing] a
 join PortfolioProject..[Nashville Housing] b
	on a.ParcelID=b.ParcelID
	and a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null

--------------------------------------------------------------------
select PropertyAddress
from PortfolioProject..[Nashville Housing]
 --where PropertyAddress is null
 --order by ParcelID

SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) as Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress)) as Address

From PortfolioProject..[Nashville Housing]


Alter Table [Nashville Housing]
Add PropertySplitAddress nvarchar(255);
update [Nashville Housing]
set PropertySplitAddress =SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) 


Alter Table [Nashville Housing]
Add PropertySplitCity nvarchar(255);
update [Nashville Housing]
set PropertySplitCity =SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress))
 
 
 select*
 From PortfolioProject..[Nashville Housing]
 ---------------------------------------------------------------------







  select OwnerAddress
 From PortfolioProject..[Nashville Housing]

select
PARSENAME(REPLACE(OwnerAddress,',','.'),3),
PARSENAME(REPLACE(OwnerAddress,',','.'),2),
PARSENAME(REPLACE(OwnerAddress,',','.'),1)

From PortfolioProject..[Nashville Housing]


Alter Table [Nashville Housing]
Add OwnerSplitAddress nvarchar(255);
update [Nashville Housing]
set OwnerSplitAddress =PARSENAME(REPLACE(OwnerAddress,',','.'),3)


Alter Table [Nashville Housing]
Add OwnerSplitCity nvarchar(255);
update [Nashville Housing]
set OwnerSplitCity =PARSENAME(REPLACE(OwnerAddress,',','.'),2)



Alter Table [Nashville Housing]
Add OwnerSplitstate nvarchar(255);

update [Nashville Housing]
set OwnerSplitState=PARSENAME(REPLACE(OwnerAddress,',','.'),1)

select*
From PortfolioProject..[Nashville Housing]

------------------------------------------------------------------
select Distinct(SoldAsVacant),count(SoldAsVacant)

From PortfolioProject..[Nashville Housing]
group by SoldAsVacant
order by 2



select SoldAsVacant
, case when SoldAsVacant='y' then 'Yes'
		when SoldAsVacant ='n' then 'NO'
		Else SoldAsVacant
		End
From PortfolioProject..[Nashville Housing]

update [Nashville Housing] 
set SoldAsVacant=case when SoldAsVacant='y' then 'Yes'
		when SoldAsVacant ='n' then 'NO'
		Else SoldAsVacant
		End
----------------------------------------------------------------



WITH RowNumCTE AS(
Select *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
					UniqueID
					) row_num

From PortfolioProject..[Nashville Housing]
--order by ParcelID
)
select*
From RowNumCTE
Where row_num > 1
Order by PropertyAddress



Select *
From PortfolioProject..[Nashville Housing]

-------------------------------------------------------

Select *
From PortfolioProject..[Nashville Housing]

Alter table  PortfolioProject..[Nashville Housing]
Drop column OwnerAddress,TaxDistrict,PropertyAddress


Alter table  PortfolioProject..[Nashville Housing]
Drop column SaleDate

-------------------------------------------------------------------------
Select *
From PortfolioProject..[Nashville Housing]