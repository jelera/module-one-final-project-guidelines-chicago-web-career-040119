module Banner
  def spacer_banner
    puts <<-SPACER



    SPACER
  end
  def company_banner
    puts <<-BANNER

              dP                     .8888b dP oo          dP         dP
              88                     88   " 88             88         88
    .d8888b. d8888P .d8888b. 88d888b. 88aaa  88 dP .d8888b. 88d888b. d8888P .d8888b.    .d8888b. .d8888b. 88d8b.d8b.
    Y8ooooo.   88   88'  `88 88'  `88 88     88 88 88'  `88 88'  `88   88   Y8ooooo.    88'  `"" 88'  `88 88'`88'`88
          88   88   88.  .88 88       88     88 88 88.  .88 88    88   88         88 dP 88.  ... 88.  .88 88  88  88
    `88888P'   dP   `88888P8 dP       dP     dP dP `8888P88 dP    dP   dP   `88888P' 88 `88888P' `88888P' dP  dP  dP
    oooooooooooooooooooooooooooooooooooooooooooooooo~~~~.88~ooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
                                                    d8888P
    BANNER
  end

  def welcome_user_banner
                                              # Welcome, #{$user[:first_name] || $user[:username]}!
    puts <<-WELCOME


                          #==========================================================#
                          #                                                          #
                          #                                                          #
                          #==========================================================#


    WELCOME
  end

  def welcome_children_banner
    puts <<-CHILDREN
**************************************
*                                    *
*          WELCOME, CHILDREN         *
*                                    *
**************************************

                 TO

           #{$COMPANY_NAME}

    CHILDREN
  end

  def book_flight_banner
    puts <<-BANNER
+---------------------------------+
|                                 |
|          BOOK A FLIGHT          |
|                                 |
-----------------------------------

    BANNER
  end

  def my_profile_banner
    puts <<-BANNER
+---------------------------------+
|                                 |
|          MY PROFILE             |
|                                 |
-----------------------------------

    BANNER

end
  def destinations_banner
    puts <<-BANNER
+-------------------------------+
|                               |
|          DESTINATIONS         |
|                               |
---------------------------------

    BANNER
  end
end
