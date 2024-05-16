function DJ = dimensionless_jerk(movement, fs)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Calculates the smoothness metric for the given speed profile using the dimensionless jerk metric.
    % This code is adapted from Balasubramaniam python functions (https://github.com/siva82kb/smoothness.git)
    %
    %
    % Calcul le DimensionLess Jerk à partir du profil de vitesse
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
    % DJ       : The dimensionless jerk estimate of the given movement's smoothness.


    % Calculate the scale factor and jerk.
    movement_peak = max(abs(movement));
    dt = 1 / fs;
    movement_dur = numel(movement) * dt;
    jerk = diff(movement, 2) / dt^2;
    scale = (movement_dur^3) / (movement_peak^2);

    % Estimate dj
    DJ = -scale * sum(jerk.^2) * dt;
end
