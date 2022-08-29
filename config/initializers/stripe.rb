# Stripe.api_key = Rails.application.credentials[:stripe][:secret]
Stripe.api_key = Rails.application.credentials.stripe[:secret]
