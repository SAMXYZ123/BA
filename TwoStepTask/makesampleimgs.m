load example
xx=xx*100;
fs=24;

figure(1);
clf;
plot([0 51],[60 60],'m','markersize',20,'linewidth',2);
xlim([0 51]);
ylim([0 100]);
set(gca,'fontsize',fs);
xlabel('Runde');
ylabel('Gewinnwahrscheinlichkeit')
myfig(gcf,'instrfuncs/samplefig0');
print(gcf,'-djpeg99',['instrfuncs/samplefig0.jpg']);


clf;
plot(xx(1,1),'.','markersize',20,'linewidth',2);
xlim([0 51]);
ylim([0 100]);
set(gca,'fontsize',fs);
xlabel('Runde');
ylabel('Gewinnwahrscheinlichkeit')
print(gcf,'-djpeg99',['instrfuncs/samplefig1.jpg']);

clf;
plot(xx(1,1:2),'linewidth',2);
hon
plot(xx(1,1:2),'.','markersize',10,'linewidth',2);
plot(2,xx(1,2),'.','markersize',20,'linewidth',2);
hof
xlim([0 51]);
ylim([0 100]);
set(gca,'fontsize',fs);
xlabel('Runde');
ylabel('Gewinnwahrscheinlichkeit')
print(gcf,'-djpeg99',['instrfuncs/samplefig2.jpg']);

clf;
plot(xx(1,1:4),'linewidth',2);
hon
plot(xx(1,1:4),'.','markersize',10,'linewidth',2);
plot(4,xx(1,4),'.','markersize',20,'linewidth',2);
hof
xlim([0 51]);
ylim([0 100]);
set(gca,'fontsize',fs);
xlabel('Runde');
ylabel('Gewinnwahrscheinlichkeit')
print(gcf,'-djpeg99',['instrfuncs/samplefig3.jpg']);

clf;
plot(xx(1,1:32),'linewidth',2);
hon
plot(xx(1,1:32),'.','markersize',10,'linewidth',2);
plot(32,xx(1,32),'.','markersize',20,'linewidth',2);
hof
xlim([0 51]);
ylim([0 100]);
set(gca,'fontsize',fs);
xlabel('Runde');
ylabel('Gewinnwahrscheinlichkeit')
print(gcf,'-djpeg99',['instrfuncs/samplefig4.jpg']);

r=real(xx(1,1:32)/100>=rand(1,32));
r(r==0)=NaN;
for k=1:32
	plot(xx(1,1:32),'linewidth',2);
	hon
	plot(xx(1,1:32),'.','markersize',10,'linewidth',2);
	plot(1:k,r(1,1:k)*90,'v','color',[.2 .5 .2],'linewidth',2);
	hof
	xlim([0 51]);
	ylim([0 100]);
	set(gca,'fontsize',fs);
	xlabel('Runde');
	ylabel('Gewinnwahrscheinlichkeit')
	print(gcf,'-djpeg99',['instrfuncs/samplefig4_' num2str(k) '.jpg']);
end

clf;
plot(xx(1,1:32),'linewidth',2);
hon
plot(xx(2,1:32),'k','linewidth',2,'linewidth',2);
plot(xx(1,1:32),'.','markersize',10,'linewidth',2);
plot(32,xx(1,32),'.','markersize',20,'linewidth',2);
plot(xx(2,1:32),'k.','markersize',10,'linewidth',2);
plot(32,xx(2,32),'k.','markersize',20,'linewidth',2);
hof
xlim([0 51]);
ylim([0 100]);
set(gca,'fontsize',fs);
xlabel('Runde');
ylabel('Gewinnwahrscheinlichkeit')
print(gcf,'-djpeg99',['instrfuncs/samplefig5.jpg']);

clf;
plot(xx(1,1:51),'linewidth',2);
hon
plot(xx(2,1:51),'k','linewidth',2,'linewidth',2);
plot(xx(1,1:51),'.','markersize',10,'linewidth',2);
plot(51,xx(1,51),'.','markersize',20,'linewidth',2);
plot(xx(2,1:51),'k.','markersize',10,'linewidth',2);
plot(51,xx(2,51),'k.','markersize',20,'linewidth',2);
hof
xlim([0 51]);
ylim([0 100]);
set(gca,'fontsize',fs);
xlabel('Runde');
ylabel('Gewinnwahrscheinlichkeit')
print(gcf,'-djpeg99',['instrfuncs/samplefig6.jpg']);


%%......................... generate some random walks
%dsigma=0.03;
%randomwalk=.15+.7*rand(4,1);
%for t=2:201
%	tmp = randomwalk(:,t-1)+dsigma*randn(4,1);
%	i=tmp<.15; tmp(i) =  .3-tmp(i);
%	i=tmp>.85; tmp(i) = 1.7-tmp(i);
%	randomwalk(:,t)=tmp;
%end
%
%fs=24;
%%subplot(121); plot(100*randomwalk(1:2,:)','k'); xlim([0 200]); ylim([0 100]); set(gca,'fontsize',fs); xlabel('Runde'); ylabel('Gewinnwahrscheinlichkeit')
%subplot(122); plot(100*randomwalk(3:4,:)','k'); xlim([0 200]); ylim([0 100]); set(gca,'fontsize',fs); xlabel('Runde');
%

