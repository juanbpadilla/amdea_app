import 'package:amdea_app/pages/pages.dart';
import 'package:amdea_app/sercices/book_service.dart';
import 'package:amdea_app/theme/app_theme.dart';
import 'package:amdea_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LibrosWidget extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {

    final libroService = Provider.of<BookService>(context);

    if( libroService.isLoading ) return LoadingPage();

    
    final double width = MediaQuery.of(context).size.width;

    return BackgroundWitget(
        widget: SingleChildScrollView(
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox( height: 60 ),

              Image(image: AssetImage('assets/logo.png'), width: width * 0.55),

              const SizedBox( height: 60 ),
              
              const Text(
                'MATERIAL BIBLIOGRÁFICO',
                style: TextStyle(
                  fontFamily: AppTheme.boldFont,
                  fontSize: 25,
                  color: AppTheme.primary
                ),
              ),

              const SizedBox( height: 40 ),

              // Divider(
              //   color: Theme.of(context).colorScheme.primary, // Puedes personalizar el color de la línea
              //   thickness: 1, // Personaliza el grosor de la línea
              //   height: 30, // Ajusta el espacio por encima de la línea
              //   indent: 0, // Ajusta el margen izquierdo de la línea
              //   endIndent: 0, // Ajusta el margen derecho de la línea
                
              // ),
              
              _ListBody(libroService: libroService,),

              SizedBox(height: 200,)
            ],
          ),
        ),
    );
  }
}

class _ListBody extends StatelessWidget {

  final BookService libroService;

  const _ListBody({super.key, required this.libroService});

  @override
  Widget build(BuildContext context) {


    return Container(
      padding: const EdgeInsets.only( bottom: 140 ),
      height: MediaQuery.of(context).size.height*0.71,
      width: double.infinity,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: libroService.libros.length,
        itemBuilder: (context, int index) {
          return ListTile(
            // onTap: () {},
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox( height: 5 ),
                Text(
                  libroService.libros[index].lesson.toUpperCase(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontFamily: AppTheme.boldFont,                    
                    fontSize: 22
                  ),
                ),
                const SizedBox( height: 5 ),
                Text(
                  libroService.libros[index].title.toUpperCase(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 18,                    
                  ),
                ),
                const SizedBox( height: 10 ),
              ],
            ),
            trailing: SvgPicture.asset(
              'assets/icons/pdf_layer.svg',
              colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
              height: 40,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(color: Theme.of(context).colorScheme.primary, thickness: 1.5, height: 5, indent: 0, endIndent: 0)
      ),
    );
  }
}