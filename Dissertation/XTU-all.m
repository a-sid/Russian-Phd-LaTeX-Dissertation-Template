function plot_stat(parsing_time, x1_args, y1_args, x2_args, y2_args)
    plot(x1_args - parsing_time, y1_args,'x--', 'LineWidth', 3)
    hold on
    plot(x2_args .- parsing_time, y2_args, 'ro-','LineWidth', 3 )
    hold off

    grid on

    h = findall (0, "-property", "fontname");
    set (h, "fontsize", 14)
    set (h, "fontname", "Times")
    xlabel('Время анализа (мин)','FontSize', 14);
    ylabel('Количество срабатываний','FontSize', 14);

    strmatrix = ['Метод встраивания';'Метод резюме'];
    legend(strmatrix, "location", "south")
endfunction


parsing_time = 7

time_inl_xtu = [26 33 47 73 127 236]
inl_xtu = [5246 5773 6257 6644 6946 7335]

time_summ_xtu = [28 41 53 83 138 281]
summ_xtu = [10259 11439 13439 14191 14465 14939]

inl_uniq_xtu = [1769 1907 2048 2143 2194 2281]
summ_uniq_xtu = [1715 1900 2066 2275 2326 2430]

time_inl_single = [11 17 28 50 90 171 327]
inl_single = [4001 4329 4549 4711 4885 5068 5196]

time_summ_single = [9.5 12 19 32 52 98 180]
summ_single = [4501 4876 5444 5674 5881 6047 6149]

inl_uniq_single = [1506 1616 1703 1771 1828 1895 1933]
summ_uniq_single = [1457 1591 1696 1773 1834 1886 1911]

inl_nodes_single = [205368108 388724504 728550979 1363474845 2554070889 4788920536 9019091013]
summ_nodes_single = [192318931 358546563 675498018 1233946550 2315109732 4498251566 8667111144]

inl_nodes_xtu = [158165811 309297081 596632714 1143554721 2189662381 4224418540]
summ_nodes_xtu = [401083292 754450343 1407398717 2858356105 5436352382 10712862615]

speed_inl_xtu = inl_uniq_xtu ./(time_inl_xtu .- parsing_time)
speed_summ_xtu = summ_uniq_xtu ./(time_summ_xtu .- parsing_time)

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
