using System;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Microsoft.Owin;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.Google;
using WebApp.Models;
using System.Threading.Tasks;
using System.Security.Claims;

namespace WebApp
{
    public partial class Startup
    {

        // Para obtener más información sobre cómo configurar la autenticación, visite https://go.microsoft.com/fwlink/?LinkId=301883
        public void ConfigureAuth(IAppBuilder app)
        {
            // Configure el contexto de bd, el administrador de usuarios y el administrador de inicio de sesión para usar una instancia única por solicitud
            app.CreatePerOwinContext(ApplicationDbContext.Create);
            app.CreatePerOwinContext<ApplicationUserManager>(ApplicationUserManager.Create);
            app.CreatePerOwinContext<ApplicationSignInManager>(ApplicationSignInManager.Create);



            // Habilitar la aplicación para que use una cookie para almacenar la información del usuario que inició sesión
            // y usar una cookie para almacenar temporalmente información sobre un usuario que inicia sesión con un proveedor de inicio de sesión de un tercero
            // Configurar la cookie de inicio de sesión
            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                LoginPath = new PathString("/Account/Login"),
                Provider = new CookieAuthenticationProvider
                {
                    OnValidateIdentity = SecurityStampValidator.OnValidateIdentity<ApplicationUserManager, ApplicationUser>(
                        validateInterval: TimeSpan.FromMinutes(30),
                        regenerateIdentity: (manager, user) => user.GenerateUserIdentityAsync(manager))
                }
            });
            // Usar una cookie para almacenar temporalmente información sobre un usuario que inicia sesión con un proveedor de inicio de sesión de un tercero
            app.UseExternalSignInCookie(DefaultAuthenticationTypes.ExternalCookie);

            // Habilita a la aplicación para almacenar temporalmente la información del usuario cuando estén comprobando el segundo factor en el proceso de autenticación de dos factores.
            app.UseTwoFactorSignInCookie(DefaultAuthenticationTypes.TwoFactorCookie, TimeSpan.FromMinutes(5));

            // Habilita a la aplicación para que recuerde el segundo factor de comprobación de inicio de sesión como teléfono o correo electrónico.
            // Una vez active esta opción, se recordará el segundo paso de comprobación durante el proceso de inicio de sesión en el dispositivo desde donde inició sesión.
            // Esto es similar a la opción RememberMe cuando inicia sesión.
            app.UseTwoFactorRememberBrowserCookie(DefaultAuthenticationTypes.TwoFactorRememberBrowserCookie);

            // Quitar las marcas de comentario de las líneas siguientes para habilitar el inicio de sesión con proveedores de inicio de sesión de terceros
            //app.UseMicrosoftAccountAuthentication(
            //    clientId: "",
            //    clientSecret: "");

            //app.UseTwitterAuthentication(
            //   consumerKey: "",
            //   consumerSecret: "");

            //app.UseFacebookAuthentication(
            //   appId: "",
            //   appSecret: "");

            var authenticationOptions = new GoogleOAuth2AuthenticationOptions()
            {
                ClientId = "43077187728-la8ivlpn2te9b7rsnnuf9q15jbl6c6c4.apps.googleusercontent.com",
                ClientSecret = "73kFlEG1cAmbykqZJTBfkgZo"
            };
            authenticationOptions.Scope.Add("profile");
            authenticationOptions.Scope.Add("openid");
            authenticationOptions.Scope.Add("email");
            // [END configure_google_auth_client]

            // [START configure_google_auth_scopes]
            // Add scope to access user's basic profile information
            //authenticationOptions.Scope.Add("profile");
            // [END configure_google_auth_scopes]

            authenticationOptions.Provider = new GoogleOAuth2AuthenticationProvider()
            {
                // [START read_google_profile_image_url]
                // After OAuth authentication completes successfully,
                // read user's profile image URL from the profile
                // response data and add it to the current user identity
                OnAuthenticated = context =>
                {
                    var profileUrl = context.User["image"]["url"].ToString();
                    context.Identity.AddClaim(new Claim(ClaimTypes.Uri, profileUrl));
                    return Task.FromResult(0);
                }
                // [END read_google_profile_image_url]
            };

            app.UseGoogleAuthentication(authenticationOptions);

        }
    }
}
