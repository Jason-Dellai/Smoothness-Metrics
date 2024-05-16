function LDLJ = log_dimensionless_jerk(movement, fs)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Calculates the smoothness metric for the given speed profile using the log dimensionless jerk metric (LDLJ).
    % This code is adapted from Balasubramaniam python functions (https://github.com/siva82kb/smoothness.git)
    %
    %
    % Calcul le Log-DimensionLess Jerk à partir du profil de vitesse (LDLJ)
    % Ce code est une adaptation des fonctions python de Balasubramaniam (https://github.com/siva82kb/smoothness.git)
    % Jason Dellai décembre 2023


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Inputs :
    % -------
    % movement : The array containing the movement speed profile.
    %
    % fs       : The sampling frequency of the data.
    %
    %
    % Output :
    % -------
    % LDLJ     : The log-dimensionless jerk estimate of the given movement's smoothness.


    % Calculate the scale factor and jerk.
    movement_peak = max(abs(movement));           %pic de vitesse
    dt = 1 / fs;
    movement_dur = numel(movement) * dt;         
    jerk = diff(movement, 2) / dt^2;              
    scale = (movement_dur^3) / (movement_peak^2); 

    % Estimate dj
    DJ = -scale * sum(jerk.^2) * dt;

    % Apply natural logarithm to the absolute value of dimensionless jerk
    LDLJ = -log(abs(DJ));
end