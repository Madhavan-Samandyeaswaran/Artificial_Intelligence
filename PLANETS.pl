% Facts
planet(mercury, rocky, 0.39, 87.97).
planet(venus, rocky, 0.72, 224.7).
planet(earth, rocky, 1, 365.26).
planet(mars, rocky, 1.52, 687).
planet(jupiter, gas_giant, 5.20, 4331).
planet(saturn, gas_giant, 9.58, 10747).
planet(uranus, ice_giant, 19.22, 30589).
planet(neptune, ice_giant, 30.05, 59800).

moon(earth, moon).
moon(mars, phobos).
moon(mars, deimos).
moon(jupiter, io).
moon(jupiter, europa).
moon(jupiter, ganymede).
moon(jupiter, callisto).
moon(saturn, titan).
moon(uranus, miranda).
moon(neptune, triton).

% Rules
has_moon(Planet) :-
    moon(Planet, _).

gas_giant(Planet) :-
    planet(Planet, gas_giant, _, _).

rocky_planet(Planet) :-
    planet(Planet, rocky, _, _).

ice_giant(Planet) :-
    planet(Planet, ice_giant, _, _).

