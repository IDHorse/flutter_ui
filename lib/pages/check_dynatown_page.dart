import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcrrm/base/base_state.dart';
import 'package:flutterappcrrm/view_models/dynatown_view_model.dart';
import 'package:flutterappcrrm/components/layout.dart';


class DyantownPage extends StatefulWidget {
  @override
  _DyantownPageState createState() => _DyantownPageState();
}

class _DyantownPageState extends BaseState<DyantownPage, DynatownViewModel> {

  int _checkedIndex;

  @override
  void onReady(DynatownViewModel viewModel) {

  }
  @override
  DynatownViewModel setViewModel()=> DynatownViewModel();

  @override
  Widget builder(BuildContext context, DynatownViewModel viewModel, Widget child) {
    return Scaffold(
        body: Layout(
          title: '选择置业顾问',
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _checkedIndex = index;
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(width: 0.2, color: Colors.grey)
                              )
                          ),
                          child: ListTile(
                            title: Text('冯宝宝'),
                            subtitle: Text('丰台片区-时代天街门店'),
                            leading: Icon(Icons.perm_identity, size: 32,),
                            trailing: index == _checkedIndex ? Icon(Icons.check, size: 32,): SizedBox(),
                          )
                      ),
                    );
                  },
                ),

              ),
             InkWell(
               onTap: (){
                 Navigator.of(context).pop();
               },
               child:  Container(
                 height: 48.0,
                 color: Colors.blue,
                 width: double.infinity,
                 alignment: Alignment.center,
                 child: Text('确定'),
               ),
             )
            ],
          ),
        )
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;


}
