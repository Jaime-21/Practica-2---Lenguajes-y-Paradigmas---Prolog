% -- vehicle(Brand, Reference, Type, Price, Year).


% -- Toyota
vehicle(toyota, 'land cruiser prado', suv, 65000, 2023).
vehicle(toyota, corolla, 'compact car', 20000, 2024).
vehicle(toyota, hilux, pickup, 50000, 2025).
vehicle(toyota, camry, sedan, 30000, 2023).
vehicle(toyota, supra, sport, 45000, 2021). 

% -- Ford
vehicle(ford, raptor, pickup, 80000, 2022).
vehicle(ford, ranger, pickup, 33000, 2023).
vehicle(ford, mustang, sport, 47000, 2023).
vehicle(ford, bronco, suv, 50000, 2019).
vehicle(ford, escape, suv, 35000, 2025).

% -- BMW
vehicle(bmw, x3, suv, 50000, 2022).
vehicle(bmw, x5, suv, 60000, 2021).
vehicle(bmw, m4, sport, 72000, 2023).
vehicle(bmw, m6, sport, 90000, 2024).
vehicle(bmw, i5, sedan, 68000, 2025).

% -- Chevrolet
vehicle(chevrolet, spark, sedan, 15000, 2020).
vehicle(chevrolet, tracker, suv, 26000, 2021).
vehicle(chevrolet, silverado, pickup, 40000, 2022).
vehicle(chevrolet, camaro, sport, 42000, 2021).
vehicle(chevrolet, traverse, suv, 35000, 2023).

% -- Budget 
meet_budget(Reference, BudgetMax):- vehicle(_, Reference, _, Price, _), Price =< BudgetMax.

% -- List by Brand
list_brand(Brand, Result):- findall(Reference, vehicle(Brand, Reference, _, _, _), Result).

% -- List by Type
list_type(Type, Result):- findall(Brand:Reference, vehicle(Brand, Reference, Type, _, _), Result).  % "Brand:Reference" para que devuelve resultados en pareja

% -- List by Year
list_year(Year, Result):- findall(Brand:Reference, vehicle(Brand, Reference, _, _, Year), Result).


% -- List by Price Range
list_price(MinPrice, MaxPrice, Result) :-
    findall(Brand:Reference,
            (vehicle(Brand, Reference, _, Price, _),
             Price >= MinPrice,
             Price =< MaxPrice),
            Result).


% -- Generate Report
generate_report(Brand, Type, Budget, result(Vehicles, Total)):-
	findall(Reference:Price, (vehicle(Brand, Reference, Type, Price, _), Price =< Budget), Vehicles), 
	findall(Price, (vehicle(Brand, _, Type, Price, _), Price =< Budget), Prices),
	sum_list(Prices, Total),  % -- sum_list suma los valores de la lista del primer parametro
	Total =< 1000000.

