# This is the configuration file of the currency scrapper modify with care the next strings.

module Config
  # This is the path where the .csv file is stored
  @path = 'dolar.csv'
  # This are the sites of each bank.
  @sites =
    {
      banamex_site: 'https://www.banamex.com/economia-finanzas/es/mercado-de-divisas/index.html',
      bancomer_site: 'https://bbv.infosel.com/bancomerindicators/indexv8.aspx',
      bancoazteca_site: 'https://web.bancoazteca.com.mx/eBanking/tcDivisas.do',
      scotiabank_site: 'https://www.scotiabank.com.mx/Empresas-y-Gobierno/Otros-Productos/Productos/tipo-de-cambio.aspx',
      banorte_site: 'https://www.banorte.com/wps/portal/banorte/Home/indicadores/dolares-y-divisas',
      inbursa_site: 'https://www.inbursa.com/portal/',
      banregio_site: 'https://www.banregio.com/divisas.php',
      banbajio_site: 'https://www.bb.com.mx/webcenter/portal/BanBajio/home?'
    }

  # This are the codes for looking in each bank !!Warning!!
  @codes =
    {
      banamex_code: 'Watir::Wait.until { browser.td(:class => ["compra","MXNUS"]).exists? }',
      bancomer_code: 'Watir::Wait.until { browser.table(:class => ["table", "tbl-info-financiera"]).exists? }',
      bancoazteca_code: 'Watir::Wait.until { browser.div(:class => ["box"]).exists? }',
      scotiabank_code: 'Watir::Wait.until { browser.div(:class => ["ulListContainer"]).exists? }',
      banorte_code: 'Watir::Wait.until { browser.div(:id => "indicadores_financieros_wrapper").exists? }',
      inbursa_code: 'Watir::Wait.until { browser.div(:id => "Divisas").exists? }',
      banregio_code: 'Watir::Wait.until { browser.table(:class => ["t-divisas"]).exists? }',
      banbajio_code: 'Watir::Wait.until { browser.input(:id => "jsonDivisas").exists? }'
    }

  @names =
    %w[
      Banamex
      Bancomer
      Banco_Azteca
      Scotiabank
      Banorte
      Inbursa
      Banregio
      Banbajio
    ]
         
  # This creates an reader access for the variables in the module.
  class << self
    attr_reader :sites
    attr_reader :codes
    attr_reader :names
    attr_reader :path
  end
end
