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

User.create_or_find_by!(email: 'owner@gmail.com',
                        password: 'example',
                        roles_mask: 1,
                        company: umbrella)

community_manager = User.create_or_find_by!(email: 'community_manager@gmail.com',
                                            password: 'example',
                                            roles_mask: 4,
                                            company: umbrella)

designer = User.create_or_find_by!(email: 'dessigner@gmail.com',
                                   password: 'example',
                                   roles_mask: 16,
                                   company: umbrella)

content_creator = User.create_or_find_by!(email: 'content_creator@gmail.com',
                                          password: 'example',
                                          roles_mask: 8,
                                          company: umbrella)

User.create_or_find_by!(email: 'rrhh@gmail.com',
                        password: 'example',
                        roles_mask: 32,
                        company: umbrella)

User.create_or_find_by!(email: 'finance@gmail.com',
                        password: 'example',
                        roles_mask: 64,
                        company: umbrella)

iphone_campain = Campain.create_or_find_by(name: 'iPhone 11',
                                           start_date: Time.now,
                                           end_date: Time.now + 1.week,
                                           objective: 'Promocionar neuvo producto',
                                           campain_type: 'Promocion',
                                           product: 'iPhone11',
                                           manager: community_manager,
                                           company: umbrella,
                                           image: Rack::Test::UploadedFile.new('test/fixtures/files/example.jpg', 'image/jpg'))

Coworker.create_or_find_by!(user: content_creator,
                            campain: iphone_campain,
                            role: 1)

Coworker.create_or_find_by!(user: designer,
                            campain: iphone_campain,
                            role: 2)
Coworker.create_or_find_by!(user: content_creator,
                            campain: iphone_campain,
                            role: 1)
Coworker.create_or_find_by!(user: content_creator,
                            campain: iphone_campain,
                            role: 1)
Coworker.create_or_find_by!(user: content_creator,
                            campain: iphone_campain,
                            role: 1)
