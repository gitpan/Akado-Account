#!/usr/bin/perl

use Test::More tests => 1;

use Akado::Account;

# subs
sub read_xml_from_data_section {
    my $data;

    while (<DATA>) {
        $data .= $_;
    }

    return $data;
}

# main
sub main {

    my $xml = read_xml_from_data_section();
    my $parsed = Akado::Account::_parse_xml(undef, $xml);

    is_deeply(
        $parsed,
        {
            date => "2012-10-02",
            balance => 1558.82,
            next_month_payment => 779,
        },
        "_parse_xml()",
    );
}

main();
__END__
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="/interface/stylesheets/transform/account.xsl"?>
<account xmlns="https://office.akado.ru" date="2012-10-02">
  <status amount="2337.82" description="Остаток средств на начало месяца"/>
  <status amount="0" description="Поступления на счет в текущем месяце" comment="Датой платежа считается дата зачисления средств на Ваш лицевой счет в АКАДО."/>
  <status amount="779" description="Стоимость услуг в текущем месяце">
    <status amount="135" description="Антенна АКАДО &quot;Базис&quot;"/>
    <status amount="4" description="Аренда кабельного модема"/>
    <status amount="640" description="Услуги интернет">
      <status amount="550" description="АКАДО 20 (Абонентская плата - av123456)"/>
      <status amount="90" description="АКАДО 20 (Поддержка внешнего IP-адреса - av123456)"/>
    </status>
  </status>
  <status amount="1558.82" description="Остаток на счете"/>
  <status amount="0" description="Рекомендуемая сумма доплаты услуг в текущем месяце" comment="Рекомендуемая сумма доплаты не включает стоимость услуг, которые Вы можете заказать до конца месяца."/>
  <status amount="0" description="Рекомендуемая сумма оплаты услуг в следующем месяце" comment="Рекомендуемая сумма оплаты не включает доплату за услуги в текущем месяце.">
    <status amount="1558.82" description="Остаток на счете"/>
    <status amount="779" description="Стоимость услуг в следующем месяце">
      <status amount="135" description="Антенна АКАДО &quot;Базис&quot;"/>
      <status amount="640" description="УСЛУГИ ИНТЕРНЕТ"/>
      <status amount="4" description="Аренда кабельного модема"/>
    </status>
  </status>
</account>
