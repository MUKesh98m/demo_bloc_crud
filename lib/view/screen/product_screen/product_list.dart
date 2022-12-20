import 'package:demo_bloc_crud/model/product_list_model.dart';
import 'package:demo_bloc_crud/view/screen/product_screen/Product_list/product_bloc.dart';
import 'package:demo_bloc_crud/view/screen/product_screen/Product_list/product_state.dart';
import 'package:demo_bloc_crud/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductLoadingState) {
            // Toast().showToast("Product IS Loading");
            Center(
              child: CircularProgressIndicator(color: Colors.red),
            );
          } else if (state is ProductLoadedState && state == null) {
            Center(
              child: CircularProgressIndicator(color: Colors.green),
            );
          }
        },
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductLoadedState) {
            return ListView.builder(
              itemCount: state.productListModel.data!.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Card(
                    // color: Colors.black,
                    elevation: 20,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Container(
                      height: 500,
                      // color: Colors.red,
                      child: Stack(
                        children: [
                          Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                                state.productListModel.data!.data![index].img ??
                                    'https://dignizant.com/flutter-api/public/images/1668493671.png',
                                fit: BoxFit.contain),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 200,
                              padding: EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 30),
                              width: MediaQuery.of(context).size.width,
                              color: Colors.black12,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${state.productListModel.data!.data![index].name}',
                                          style: GoogleFonts.alice(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.favorite_border))
                                      ],
                                    ),
                                    Text(
                                      textAlign: TextAlign.start,
                                      '${state.productListModel.data!.data![index].description}',
                                      style: GoogleFonts.alice(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      textAlign: TextAlign.start,
                                      '\$ ${state.productListModel.data!.data![index].mrp}',
                                      style: GoogleFonts.alice(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          if (state is ProductErrorState) {
            return Center(
              child: Text(state.error.toString()),
            );
          }
          return Container();
        },
      ),
    );
  }

// Widget _buldeContainer(ProductListModel productListModel) {
//   // return Text(
//   //   "${productListModel.data!.data!.last.name}",
//   //   style: const TextStyle(color: Colors.black, fontSize: 50),
//   // );
//   return
// }
}
