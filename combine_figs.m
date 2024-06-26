function combine_figs(fig1_path, fig2_path, fig3_path, output_path)
    % Load the first figure
    fig1 = openfig(fig1_path, 'invisible');
    ax1 = gca(fig1);
    
    % Get the data from the first figure
    lines1 = findall(ax1, 'Type', 'Line');
    xdata1 = get(lines1, 'XData');
    ydata1 = get(lines1, 'YData');
    
    % Close the first figure
    close(fig1);

    % Load the second figure
    fig2 = openfig(fig2_path, 'invisible');
    ax2 = gca(fig2);
    
    % Get the data from the second figure
    lines2 = findall(ax2, 'Type', 'Line');
    xdata2 = get(lines2, 'XData');
    ydata2 = get(lines2, 'YData');
    
    % Close the second figure
    close(fig2);
    
    % Load the third figure
    fig3 = openfig(fig3_path, 'invisible');
    ax3 = gca(fig3);
    
    % Get the data from the third figure
    lines3 = findall(ax3, 'Type', 'Line');
    xdata3 = get(lines3, 'XData');
    ydata3 = get(lines3, 'YData');
    
    % Close the third figure
    close(fig3);

    % Create a new figure
    figure;
    hold on;
    set(gca, 'XScale', 'log', 'YScale', 'log');

    % Plot the data from the first figure with one color
    if iscell(xdata1)
        for i = 1:length(xdata1)
            plot(xdata1{i}, ydata1{i}, 'r'); % Use red color for the first plot
        end
    else
        plot(xdata1, ydata1, 'r');
    end

    % Plot the data from the second figure with another color
    if iscell(xdata2)
        for i = 1:length(xdata2)
            plot(xdata2{i}, ydata2{i}, 'b'); % Use blue color for the second plot
        end
    else
        plot(xdata2, ydata2, 'b');
    end

    % Plot the data from the third figure with another color
    if iscell(xdata3)
        for i = 1:length(xdata3)
            plot(xdata3{i}, ydata3{i}, 'g'); % Use green color for the third plot
        end
    else
        plot(xdata3, ydata3, 'g');
    end

    % Add labels, title, and legend
    xlabel('h');
    ylabel('Absoluter Fehler');
    title('Absoluter Fehler von D_e, D_z und D_{excel} für sin(x)');
    legend('D_e', 'D_z', 'D_{excel}'); % Show filenames in legend

    hold off;
    
    % Save the combined figure
    savefig(output_path);
end
