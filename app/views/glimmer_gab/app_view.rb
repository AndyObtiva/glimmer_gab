    class GlimmerGab
      class AppView
        include Glimmer::UI::CustomShell
        
        ## Add options like the following to configure CustomShell by outside consumers
        #
        # options :title, :background_color
        # option :width, default: 320
        # option :height, default: 240
        # option :greeting, default: 'Hello, World!'
    
        ## Use before_body block to pre-initialize variables to use in body
        #
        #
        before_body {
          Display.app_name = 'Glimmer Gab'
          Display.app_version = VERSION
          @display = display {
            on_about {
              display_about_dialog
            }
            on_preferences {
              display_about_dialog
            }
          }
        }
    
        ## Use after_body block to setup observers for widgets in body
        #
        # after_body {
        #
        # }
    
        ## Add widget content inside custom shell body
        ## Top-most widget must be a shell or another custom shell
        #
        body {
          shell {
            # Replace example content below with custom shell content
            minimum_size 640, 360
            image File.join(APP_ROOT, 'package', 'linux', "Glimmer Gab.png")
            text "Glimmer Gab"
            
            on_swt_show {
              body_root.set_size 1024, 576
              body_root.center_within_display
            }
          
            browser(OS.linux? ? :chromium : :none) {
              url "https://gab.com"
            }
            
            menu_bar {
              menu {
                text '&File'
                menu_item {
                  text '&About...'
                  on_widget_selected {
                    display_about_dialog
                  }
                }
                menu_item {
                  text '&Preferences...'
                  on_widget_selected {
                    display_about_dialog
                  }
                }
              }
            }
          }
        }
    
        def display_about_dialog
          message_box(body_root) {
            text 'About'
            message "Glimmer Gab #{VERSION}\n\n#{LICENSE}"
          }.open
        end
        
      end
    end
