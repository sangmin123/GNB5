function set_ymax(ratio_ymax)
    ax = gca;
    yl = ylim(ax);
    yl(1) = 0.0;
    yl(2) = ratio_ymax*yl(2);
    ylim(ax, yl);
end

