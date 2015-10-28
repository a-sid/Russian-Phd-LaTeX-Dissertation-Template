time_inl=[26 33 47 73 127 236]
inl=[5246 5773 6257 6644 6946 7335]

time_summ=[28 41 53 83 138 281 ]
summ=[10259 11439 13439 14191 14465 14939]

plot(time_inl, inl,'x--', 'LineWidth',3)
hold on
plot(time_summ,summ, 'ro-','LineWidth',3 )


grid on

h = findall (0, "-property", "fontname");
set (h, "fontsize", 14)
set (h, "fontname", "Times")
xlabel('Время анализа (мин)','FontSize',14);
ylabel('Количество срабатываний','FontSize',14);

strmatrix = ['Метод встраивания';'Метод резюме'];
legend(strmatrix, "location", "south")
