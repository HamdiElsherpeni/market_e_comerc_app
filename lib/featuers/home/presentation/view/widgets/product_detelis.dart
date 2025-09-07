import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/manger/add_product_cubit/add_product_cubit_cubit.dart';

class ProductDetailsPage extends StatefulWidget {
  final String id; // معرف المنتج
  final List<String> images;
  final String title;
  final String description;
  final int price;
  final double rating;
  final bool freeShipping;
  final List<int> sizes;

  const ProductDetailsPage({
    super.key,
    required this.id,
    required this.images,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.freeShipping,
    required this.sizes,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;
  int selectedImage = 0;

  @override
  void initState() {
    super.initState();
    if (widget.sizes.isNotEmpty) {
      selectedSize = widget.sizes[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Product Details"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Main Image
            SizedBox(
              height: 220,
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() => selectedImage = index);
                },
                itemCount: widget.images.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    widget.images[index],
                    fit: BoxFit.contain,
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.images.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: selectedImage == index ? 12 : 8,
                  height: selectedImage == index ? 12 : 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selectedImage == index ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Free shipping + Rating
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  if (widget.freeShipping)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blue.withOpacity(0.1),
                      ),
                      child: const Text(
                        "Free Shipping",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange.shade400, size: 20),
                      const SizedBox(width: 4),
                      Text("(${widget.rating.toStringAsFixed(1)})"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // Title + Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Product Value",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: const TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // Size selection
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Select Size",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: widget.sizes.map((size) {
                      final isSelected = selectedSize == size;
                      return GestureDetector(
                        onTap: () => setState(() => selectedSize = size),
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isSelected
                                  ? Colors.blue
                                  : Colors.grey.shade300,
                            ),
                            color: isSelected
                                ? Colors.blue.withOpacity(0.1)
                                : Colors.transparent,
                          ),
                          child: Text(
                            size.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.blue : Colors.black,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Price + Add to cart
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey.shade200)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.price.toStringAsFixed(2)} EGP",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  BlocConsumer<AddProductCubitCubit, AddProductCubitState>(
                    listener: (context, state) {
                      if (state is AddProductCubitFailer &&
                          state.productId == widget.id) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMassge)),
                        );
                      } else if (state is AddProductCubitSucsess &&
                          state.productId == widget.id) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Product added to cart successfully!",
                            ),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      final isLoading =
                          state is AddProductCubitLoading &&
                          state.productId == widget.id;

                      return ElevatedButton.icon(
                        onPressed: isLoading
                            ? null
                            : () {
                                context.read<AddProductCubitCubit>().addProduct(
                                  productId: widget.id,
                                );
                                setState(() {});
                              },
                        icon: isLoading
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.shopping_bag_outlined),
                        label: Text(isLoading ? "Adding..." : "Add to Cart"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
