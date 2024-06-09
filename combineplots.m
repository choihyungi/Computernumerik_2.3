function combineplots(filename1, filename2, filename3, ymin, ymax, ttl, xlbl, ylbl)
%{
Status: complete
Task: combine plots
Parameter:
    filename1           of 1st plot
    filename2           of 2nd plot
    filename3           save location of combined 3rd plot
    ymin                min range of y-axis of 3rd plot
    ymax                max range of y-axis of 3rd plot
    ttl                 title of 3rd plot
    xlbl                xlabel
    ylbl                ylabel
Return:
    void
%}
    %First Figure
    h1 = openfig(filename1,'reuse'); % open figure
    ax1 = gca; % get handle to axes of figure
    %Second Figure
    h2 = openfig(filename2,'reuse');
    ax2 = gca;
    
    %third new figure
    h3 = figure;            %create new figure
    s1 = subplot(1,1,1);    %create and get handle to the subplot axes
    ylim([ymin ymax]);
    fig1 = get(ax1,'children'); %get handle to all the children in the figure
    fig2 = get(ax2,'children');
    title(ttl)
    xlabel(xlbl);
    ylabel(ylbl);
    copyobj(fig1,s1); %copy children to new parent axes i.e. the subplot axes
    legend;
    copyobj(fig2,s1);
    legend;
    savefig(h3, filename3);
    close all;
end