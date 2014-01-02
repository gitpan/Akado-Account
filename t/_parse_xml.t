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
            balance => 484,
            next_month_payment => 484,
        },
        "_parse_xml()",
    );
}

main();
__END__
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="/interface/stylesheets/transform/account.xsl"?>
<account xmlns="https://office.akado.ru" date="2014-01-02" account-type="0">
  <status amount="968" description="Остаток средств на 01.01.2014"/>
  <status amount="0" description="Поступления на счет в январе 2014" comment="Датой платежа считается дата зачисления средств на Ваш лицевой счет в АКАДО."/>
  <status amount="484" description="Стоимость услуг в январе 2014">
    <status amount="4" description="Аренда кабельного модема"/>
    <status amount="480" description="Услуги интернет">
      <status amount="390" description="АКАДО Интернет 15 (Абонентская плата - av123456)"/>
      <status amount="90" description="АКАДО Интернет 15 (Поддержка внешнего IP-адреса - av123456)"/>
    </status>
  </status>
  <status amount="484" description="Остаток средств на 31.01.2014"/>
  <status amount="0" description="Рекомендуемая сумма доплаты услуг в январе 2014" comment="Рекомендуемая сумма доплаты не включает стоимость услуг, которые Вы можете заказать до конца месяца."/>
  <status amount="0" description="Рекомендуемая сумма для внесения на счет в следующем календарном месяце" comment="Рекомендуемая сумма оплаты не включает доплату за услуги в текущем месяце.">
    <status amount="484" description="Остаток на счете на 31.01.2014"/>
    <status amount="484" description="Стоимость услуг в следующем календарном месяце">
      <status amount="480" description="УСЛУГИ ИНТЕРНЕТ"/>
      <status amount="4" description="Аренда кабельного модема"/>
    </status>
  </status>
</account>
