import 'package:e_commerce/features/home/domain/entities/product_entity/datum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatelessWidget {
  DatumProdcutEntity? model;
  ProductDetails({this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: const Color(0xff06004F),
            size: 25.sp,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'product details',
          style: GoogleFonts.poppins(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xff06004F),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: const Color(0xff004182),
              size: 25.sp,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: const Color(0xff004182),
              size: 25.sp,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.network(
                model?.image ?? '',
                height: 300.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 250.w,
                child: Text(
                  '${model!.name}}',
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff06004F),
                  ),
                ),
              ),
              Text(
                'EGP  ${model!.price}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff06004F),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 102.w,
                height: 34.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    width: .5.w,
                    color: const Color(0xff004182),
                  ),
                ),
                // child: Text(
                //   '${model!.sold} Sold',
                //   style: GoogleFonts.poppins(
                //     fontSize: 15.sp,
                //     fontWeight: FontWeight.w500,
                //     color: const Color(0xff004182),
                //   ),
                // ),
              ),
              SizedBox(
                width: 10.w,
              ),
              const Icon(Icons.star, color: Colors.yellow),
              // Text(model!.ratingsAverage.toString()),
              SizedBox(
                width: 15.w,
              ),
              // Text('(${model!.ratingsQuantity})'),
              const Spacer(),
              Container(
                width: 122.w,
                height: 42.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: const Color(0xff004182),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '1',
                      style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text('Description:',
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff06004F),
              )),
          Text(
            textScaleFactor: 1.2,
            model!.description!.replaceAll('\n', ''),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              fontSize: 15.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
