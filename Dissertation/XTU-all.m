function plot_stat(parsing_time, x1_args, y1_args, x2_args, y2_args, is_log)
    if (is_log)
        plot_func = @semilogy
    else
        plot_func = @plot
    endif

    plot_func(x1_args - parsing_time, y1_args,'x--', 'LineWidth', 3)
    hold on
    plot_func(x2_args .- parsing_time, y2_args, 'ro-','LineWidth', 3 )
    hold off

    grid on

    h = findall (0, "-property", "fontname");
    set (h, "fontsize", 14)
%    set (h, "fontname", "Times")
    xlabel('Время анализа (мин)','FontSize', 14);
    ylabel('Количество срабатываний','FontSize', 14);

    strmatrix = ['Метод встраивания';'Метод резюме'];
    legend(strmatrix, "location", "south")
endfunction


parsing_time = 7

time_inl_xtu = [26 33 47 73 127 236]
inl_xtu = [79019 159236 308988 606951 1168253 2185124]

time_summ_xtu = [28 41 53 83 138 281]
summ_xtu = [207120 358641 653184 1159685 2348704 4487512]

inl_uniq_xtu = [1769 1907 2048 2143 2194 2281]
summ_uniq_xtu = [1715 1900 2066 2275 2326 2430]

time_inl_single = [11 17 28 50 90 171 327]
inl_single = [81861 164551 318558 624176 1199886 2242228 4189537]

time_summ_single = [9.5 12 19 32 52 98 180]
summ_single = [209038 366782 658994 1174869 2358712 4465568 8661287]

inl_uniq_single = [1506 1616 1703 1771 1828 1895 1933]
summ_uniq_single = [1457 1591 1696 1773 1834 1886 1911]

inl_nodes_single = [269801191 499507572 925027113 1718978657 3208768930 6005462215 11308674270]
summ_nodes_single = [1939686032 3902559195 8491119427 16767914709 33070365021 66983139115 136701742738]

inl_nodes_xtu = [237977046 443934975 826827359 1542287067 2890560905 5426897222]
summ_nodes_xtu = [1878728779 3795905306 8230123763 16370660264 32330373229 65211735857]

speed_inl_xtu = inl_uniq_xtu ./(time_inl_xtu .- parsing_time)/60
speed_summ_xtu = summ_uniq_xtu ./(time_summ_xtu .- parsing_time)/60

figure(1)
plot_stat(parsing_time, time_inl_xtu, inl_xtu, time_summ_xtu, summ_xtu)

figure(2)
plot_stat(parsing_time, time_inl_xtu, inl_uniq_xtu, time_summ_xtu, summ_uniq_xtu)

figure(3)
plot_stat(parsing_time, time_inl_single, inl_single, time_summ_single, summ_single)

figure(4)
plot_stat(parsing_time, time_inl_single, inl_uniq_single, time_summ_single, summ_uniq_single)

figure(5)
plot_stat(parsing_time, time_inl_xtu, speed_inl_xtu, time_summ_xtu, speed_summ_xtu)

figure(6)
plot_stat(parsing_time, time_inl_single, inl_nodes_single, time_summ_single, summ_nodes_single)

figure(7)
plot_stat(parsing_time, time_inl_xtu, inl_nodes_xtu, time_summ_xtu, summ_nodes_xtu)
