# frozen_string_literal: true

# # frozen_string_literal: true

umbrella = Company.create_or_find_by!(name: 'Umbrella',
                                      legal_representant_name: 'Aaron Barreto',
                                      legal_representant_email: 'aaron@gmail.com',
                                      legal_representant_phone: '312-000-0012',
                                      legal_representant_role: 'CTO',
                                      bussines_name: 'UMBRELLA CORP.',
                                      rfc: 'ERDF1332KJDH197ED',
                                      location: 'Av. Tecnológico N.123')

User.create_or_find_by!(email: 'admin@gmail.com',
                        password: 'example',
                        roles_mask: 1,
                        company: umbrella)
