Rails.application.config.middleware.use OmniAuth::Builder do

  provider :wsfed,
    :issuer_name           => "http://your-azure-acs-namespace.accesscontrol.windows.net",
    :issuer                => "https://your-azure-acs-namespace.accesscontrol.windows.net/v2/wsfederation",
    :realm                 => "http://my.relyingparty/realm",
    :reply                 => "http://localhost:3000/auth/wsfed/callback",
    :id_claim              => "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name",
    :idp_cert_fingerprint  => "FC96D2983…"

end