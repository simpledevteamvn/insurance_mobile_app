import 'package:flutter/material.dart';
import 'package:shop_app/models/ContractResponse.dart';
import 'package:shop_app/screens/quotation/components/contract_card.dart';

class QuotaResult extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    List<ContractResponse> lstContracts = arg['data'];

    return Container(
        margin: EdgeInsets.all(0),
        child:
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: ListView.builder(
              itemCount: lstContracts.length,
              itemBuilder: (context, index) =>
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Dismissible(
                      key: Key(lstContracts[index].contractno),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFE6E6),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      child: ContractCard(contract: lstContracts[index]),
                    ),
                  ),
            ),
          )
    );
  }
}
