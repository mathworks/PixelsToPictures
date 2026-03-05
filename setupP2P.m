function setupP2P
%SETUPP2P Setup Pixels to Pictures courseware (install apps + set paths)

disp('Setting up Pixels to Pictures courseware...');

% Folder containing this setup file
rootDir = fileparts(mfilename('fullpath'));

%% Install Apps (from .mlappinstall files)
disp('Checking Pixels to Pictures apps...');

appsDir = fullfile(rootDir, 'apps');

% Installer files you listed
appInstallers = [ ...
    "BlockPuzzles.mlappinstall"
    "ColorsRGB.mlappinstall"
    "RGBtoImage.mlappinstall"
    "WordSearch.mlappinstall" ];

% Corresponding app "names" to look for in installed add-ons
appNames = erase(appInstallers, ".mlappinstall");

% Pull installed add-ons once (apps + toolboxes live here)
installed = [];
try
    installed = matlab.addons.installedAddons;
catch
    % If this API is unavailable in a given environment, we'll fall back to attempting installs.
    installed = [];
end

for k = 1:numel(appInstallers)
    installerPath = fullfile(appsDir, appInstallers(k));

    if exist(installerPath, 'file') ~= 2
        warning('P2P:MissingInstaller', ...
            'Missing app installer file: %s', installerPath);
        continue
    end

    % Skip install if already present
    if ~isempty(installed) && isAddonInstalled(installed, appNames(k))
        disp("  Already installed: " + appNames(k) + " (skipping)");
        continue
    end

    % Programmatic install (recommended for setup scripts installing apps)
    try
        disp("  Installing: " + appInstallers(k));
        matlab.apputil.install(installerPath);
    catch ME
        warning('P2P:InstallFailed', ...
            'Failed to install %s.\n%s', appInstallers(k), ME.message);
    end
end

%% Add course folders to MATLAB path
imageLibDir        = fullfile(rootDir, 'Image Library');
studentScriptsDir  = fullfile(rootDir, 'student_live_scripts');
helperFuncDir      = fullfile(rootDir, 'helper_functions');
instructorResDir   = fullfile(rootDir, 'instructor_resources');

if isfolder(imageLibDir)
    addpath(genpath(imageLibDir));
else
    warning('P2P:MissingFolder', 'Missing folder: %s', imageLibDir);
end

if isfolder(studentScriptsDir)
    addpath(genpath(studentScriptsDir));
else
    warning('P2P:MissingFolder', 'Missing folder: %s', studentScriptsDir);
end

if isfolder(helperFuncDir)
    addpath(genpath(helperFuncDir));
else
    warning('P2P:MissingFolder', 'Missing folder: %s', helperFuncDir);
end

if isfolder(instructorResDir)
    addpath(genpath(instructorResDir));
else
    warning('P2P:MissingFolder', 'Missing folder: %s', instructorResDir);
end

disp('Course setup complete.');
disp('Apps are now available under the Apps tab → My Apps.');

end


function tf = isAddonInstalled(installedTbl, appName)
% Checks whether an add-on with a matching name is installed.
% Uses defensive checks since the returned table can vary by release.

tf = false;

try
    % Most common: installedTbl has a "Name" variable
    if istable(installedTbl) && any(strcmp(installedTbl.Properties.VariableNames, "Name"))
        names = string(installedTbl.Name);
        tf = any(strcmpi(names, appName));
        if tf, return; end
    end

    % Fallback: sometimes the display name may differ; try a contains match
    if istable(installedTbl) && any(strcmp(installedTbl.Properties.VariableNames, "Name"))
        names = string(installedTbl.Name);
        tf = any(contains(lower(names), lower(appName)));
        if tf, return; end
    end
catch
    tf = false;
end
end

% © COPYRIGHT 2024 by The MathWorks®, Inc.