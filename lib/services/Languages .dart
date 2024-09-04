import 'dart:ui';

import 'package:get/get.dart';

import '../functions/functions.dart';

class Languages implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "fr": {
          "ChangeLanguage": "Changer de langue",
          "Language": "Les langues",
          "Place": "Places",
          "francais": "Français",
          "arab": "Arabe",
          "Welcome to": "Bienvenue de nouveau !",
          "Login to Your Account": "Connectez-vous à votre compte",
          "E-mail": "E-mail",
          "Password": "Mot de passe",
          "Forgot Password ?": "Mot de passe oublié ?",
          "Sign In": "Se connecter",
          "New in": "Nouveau chez",
          "Create new Account": "Créer un nouveau compte",
          "Individual": "Individuel",
          "Forgot password": "Mot de passe oublié",
          "Forgot your password ?": "Vous avez oublié votre mot de passe ?",
          "Enter your email, and we will send you a link to enter a new password.":
              "Entrez votre e-mail, et nous vous enverrons un lien pour entrer un nouveau mot de passe.",
          "Please enter an email": "Veuillez entrer un e-mail",
          "Please enter a valid email": "Veuillez entrer un e-mail valide",
          "Send link": "Envoyer le lien",
          "An email has been sent to change the password to your account: ":
              "Un e-mail a été envoyé pour changer le mot de passe de votre compte :",
          "Continue": "Continuer",
          "Please enter your password": "Veuillez entrer votre mot de passe",
          "The password cannot contain more than 20 characters":
              "Le mot de passe ne peut pas contenir plus de 20 caractères",
          "The password cannot contain less than 8 characters":
              "Le mot de passe ne peut pas contenir moins de 8 caractères",
          "You don't have an account": "Vous n'avez pas de compte ?",
          "Registration": "Inscription",
          "Check your email": "Vérifiez votre e-mail ",
          "A verification message has been sent to your email address":
              "Un message de vérification a été envoyé à votre adresse e-mail",
          "Welcome to the Fixell application-Create a new account":
              "Bienvenue dans l'application Khadamat\nCréer un nouveau compte",
          "Please enter your username":
              "Veuillez entrer votre nom d'utilisateur",
          " username": "Nom d'utilisateur",
          "The Username field must contain at least 3 characters":
              "Le champ Nom d'utilisateur doit contenir au moins 3 caractères",
          "User type": "Type d'utilisateur",
          "Select category": "Sélectionnez la catégorie",
          "Your basket is empty": "Votre panier est vide",
          "Confirm": "Confirmation",
          "There is no rating": "Il n'y a pas de notation",
          "Add a rating": "Ajouter une notation",
          "Edit rating": "Modifier la notation",
          "cancellation": "Annulation",
          "My review": "Mon avis",
          "Home": "Accueil",
          "products": "Produits",
          "shopping cart": "Panier d'achat",
          "Maintenance requests": "Demandes d'entretien",
          "Reformers": "Réparateurs",
          "Maintenance request status": "État de la demande d'entretien",
          "There are no requests currently":
              "Il n'y a pas de demandes en cours",
          "On hold": "En attente",
          "In process": "En cours de traitement",
          "complete": "Complet",
          "Product Description": "Description du produit",
          "add to cart": "Ajouter au panier",
          "There are no products": "Il n'y a pas de produits",
          "Search for a product": "Rechercher un produit...",
          "There are no results for the search":
              "Il n'y a pas de résultats pour la recherche",
          "Find a repairman": "Trouver un réparateur",
          "My account": "Mon compte",
          "orders": "Les commandes",
          "Profile": "Profil",
          "Customer reviews": "Avis des clients",
          "There are no reviews": "Il n'y a pas d'avis",
          "Phone repairman": "Réparateur de téléphones",
          "exploration": "Exploration",
          "Favorites": "Favoris",
          "Change language": "Changer de langue",
          "Log out": "Déconnexion",
          "Please wait": "Veuillez patienter",
          "Added successfully": "Ajouté avec succès",
          "The product already exists": "Le produit existe déjà",
          "An error occurred, please try again later.":
              "Erreur, veuillez réessayer plus tard.",
          "User not found": "Utilisateur non trouvé",
          "wrong-password": "Mot de passe incorrect",
          "Password or email is invalid, please try again":
              "Mot de passe ou email invalide, veuillez réessayer",
          "weak-password": "Mot de passe faible, veuillez le changer",
          "email-already-in-use": "Email déjà utilisé",
          "Something is not right": "Erreur, quelque chose a mal tourné",
          "The account has been confirmed. Please log in.":
              "Le compte a été confirmé, veuillez vous connecter.",
          "DA": "DA",
          "total": "Totale: ",
          "ide": "Nom :",
          "date": "Date : ",
          "state": "Etat :",
          "add comment": "Commentaire",
          "commentText": "Text",
          "annuler": "Annuler",
          "costumer comments": "Les commentaires",
          "no comments": "Pas de commantaires",
          "Réserver": "Réserver",
          "Order placed successfully": "Commande passée avec succès",
          "Renting houses": "Location de maisons",
          "Tourist Agencies": "Agences de Tourisme",
          "Touristic guide": "Guide touristique",
          "Houses": "Maisons",
          "Search for hotel": "Chercher un hotel",
          "Hotel Name": "Nom du hotel",
          "Phone": "Numéo de téléphone",
          "Visit the link": "visiter le lien",
          "Click to go": "Cliquer pour visiter le lien",
          "Stars number": "Nombres d'étoiles",
          "No stars": "Pas d'étoiles",
          "Des": "Description",
          "Electronic visa": "Visa électronique",
          "Name": "Nom et Prénom"
        },
        "ar": {
          "ChangeLanguage": "تغيير اللغة",
          "Language": "اللغات",

          "francais": "الفرنسية",
          "english": "الإنجليزية",
          "arab": "العربية",
          "Welcome to": 'مرحبا بك مجددا!',
          "Login to Your Account": "تسجيل الدخول إلى حسابك",
          "E-mail": "البريد الإلكتروني",
          "Password": "كلمة المرور",
          "Forgot Password ?": "هل نسيت كلمة المرور؟",
          "Sign In": "تسجيل الدخول",
          "New in": "جديد في",
          "Create new Account": "إنشاء حساب جديد",
          "Individual": "فردي",
          "Forgot password": "نسيت كلمة المرور",
          "Forgot your password ?": "هل نسيت كلمة المرور الخاصة بك؟",
          "Enter your email, and we will send you a link to enter a new password.":
              "أدخل بريدك الإلكتروني، وسنرسل لك رابطًا لإدخال كلمة مرور جديدة.",
          "Please enter an email": "يرجى إدخال بريد إلكتروني",
          "Please enter a valid email": "يرجى إدخال بريد إلكتروني صالح",
          "Send link": "إرسال الرابط",
          "An email has been sent to change the password to your account: ":
              "تم إرسال بريد إلكتروني لتغيير كلمة المرور لحسابك:",
          "Continue": "متابعة",
          "Please enter your password": "يرجى إدخال كلمة المرور",
          "The password cannot contain more than 20 characters":
              "لا يمكن أن تحتوي كلمة المرور على أكثر من 20 حرفًا",
          "The password cannot contain less than 8 characters":
              "لا يمكن أن تحتوي كلمة المرور على أقل من 8 أحرف",
          "You don't have an account": "ليس لديك حساب؟",
          "Registration": "التسجيل",
          "Check your email": "تحقق من بريدك الإلكتروني",
          "A verification message has been sent to your email address":
              "تم إرسال رسالة تحقق إلى عنوان بريدك الإلكتروني",
          "Welcome to the Fixell application-Create a new account":
              "مرحبًا بك في تطبيق خدمات\nإنشاء حساب جديد",
          "Please enter your username": "يرجى إدخال اسم المستخدم",
          " username": "اسم المستخدم",
          "The Username field must contain at least 3 characters":
              "يجب أن يحتوي حقل اسم المستخدم على 3 أحرف على الأقل",
          "User type": "نوع المستخدم ",
          "Select category": "اختر الفئة",
          "Your basket is empty": "سلتك فارغة",
          "Confirm": "تاكيد",
          "There is no rating": "لا يوجد تقييم",
          "Add a rating": "أضف تقييم",
          "Edit rating": "عدل التقييم",
          "cancellation": "الغاء",
          "My review": "تقييمي",
          "Home": "الرئيسية",
          "products": "منتجات",
          "shopping cart": "عربة التسوق",
          "Maintenance requests": "طلبات الصيانة",
          "Reformers": "المصلحين",
          "Maintenance request status": "حالة طلب الصيانة",
          "There are no requests currently": "لا توجد طلبات حاليا",
          "On hold": "قيد الانتظار",
          "In process": "قيد المعالجة",
          "complete": "مكتمل",
          "Product Description": "وصف المنتج",
          "add to cart": "اضف الى السلة",
          "There are no products": "لا يوجد منتجات",
          "Search for a product": "ابحث عن منتج ...",
          "There are no results for the search": "لايوجد نتائج للبحث",
          "Find a repairman": "ابحث عن مصلح",
          "My account": "حسابي",
          "orders": "الطلبات",
          "Profile": "الملف الشخصي",
          "Customer reviews": "مراجعات الزبائن",
          "There are no reviews": "لا توجد مراجعات",
          "Phone repairman": "مصلح هواتف",
          "exploration": "استكشاف",
          "Favorites": "المفضلة",
          "Change language": "تغيير اللغة",
          "Log out": "تسجيل الخروج",
          "Please wait": "يرجى لانتظار",
          "Added successfully": "تمت الإضافة بنجاح",
          "The product already exists": "المنتج موجود بالفعل",
          "An error occurred, please try again later.":
              "حدث خطأ، يرجى المحاولة مرة أخرى في وقت لاحق.",
          "User not found": "لم يتم العثور  على المستخدم",
          "wrong-password": "كلمة مرور خاطئة",
          "Password or email is invalid, please try again":
              "كلمة المرور أو البريد الإلكتروني غير صالح، يرجى المحاولة مرة أخرى",
          "weak-password": "كلمة المرور ضعيفة، يرجى تغييرها",
          "email-already-in-use": "البريد الاليكتروني قيد الاستخدام",
          "Something is not right": "هناك شئ غير صحيح",
          "The account has been confirmed. Please log in.":
              "تم تأكيد الحساب. الرجاء تسجيل الدخول.",
          "DA": "دج",
          "total": "المجموع:",
          "ide": "معرف الطلب:",
          "date": "التاريخ : ",
          "state": "الحالة :",
          "add comment": "أضف مراجعة",
          "commentText": "نص المراجعة",
          "annuler": "الغاء",
          "costumer comments": "مراجعات الزبائن",
          "no comments": "لا توجد مراجعات",
          "Réserver": "حجز موعد",
          "Order placed successfully": "تم تقديم الطلب بنجاح",
          // "add comment"
          "Renting houses": "كراء المنازل",
          "Tourist Agencies": "الوكالات السياحية",
          "Touristic guide": "المرشد السياحي",
          "Houses": "المنازل",
          "Search for hotel": "ابحث عن الفنادق",
          "Hotel Name": "اسم الفندق",
          "Phone": 'رقم الهاتف',
          "Visit the link": "قم بزيارة المنشور",
          "Click to go": 'اضغط للدهاب الى المنشور',
          "Stars number": "عدد النجوم",
          "No stars": "لا يوجد ",
          "Des": "وصف",
          "Electronic visa": "تاشيرة الكترونية",
          "Name": 'الاسم و اللقب',
          "Place": "المكان",
        }
      };
  static Locale initLang() {
    if (MainFunctions.sharredPrefs!.getString("codeLang") == null) {
      // if (Get.deviceLocale! != Locale('en') &&
      //     Get.deviceLocale! != Locale('fr') &&
      //     Get.deviceLocale! != Locale('ar')) {
      //   return Locale('en');
      // } else {
      // return Get.deviceLocale!;
      return const Locale('fr');
      // }
    } else {
      return Locale(MainFunctions.sharredPrefs!.getString("codeLang")!);
    }
  }
}
