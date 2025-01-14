function setupP2P
disp('Installing Pixels to Pictures toolbox.');
rootDir = fileparts(mfilename('fullpath'));

toolboxFile = fullfile(rootDir, 'Pixels to Pictures.mltbx');
toolboxes = matlab.addons.toolbox.installedToolboxes;
if(~isempty(toolboxes) && any(strcmp({toolboxes.Name}, "Pixels to Pictures")))

    answer = questdlg('A toolbox named Pixels to Pictures is already installed. Would you like to uninstall and reinstall?', ...
        'Reinstall Toolbox', ...
        'Yes', 'No', 'No');
    switch answer
        case 'Yes'
            disp('Installing toolbox. This may take several minutes.');
            toolboxName = toolboxes((strcmp({toolboxes.Name}, "Pixels to Pictures")));
            matlab.addons.toolbox.uninstallToolbox(toolboxName);
            matlab.addons.toolbox.installToolbox(toolboxFile);
            disp('Pixels to Pictures toolbox installed.');
    end
else
    disp('Installing toolbox. This may take several minutes.');
    matlab.addons.toolbox.installToolbox(toolboxFile);
    disp('Pixels to Pictures toolbox installed');
end

disp('Course setup complete');

end

% © COPYRIGHT 2024 by The MathWorks®, Inc.