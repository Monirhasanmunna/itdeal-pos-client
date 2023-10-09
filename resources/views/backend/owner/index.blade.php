@extends('backend.layout.main') @section('content')
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif
@if(session()->has('message'))
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{!! session()->get('message') !!}</div>
@endif
<section>
    <div class="container-fluid">
        @if(in_array("suppliers-add", $all_permission))
        <a href="{{route('owner.create')}}" class="btn btn-info"><i class="dripicons-plus"></i> {{trans('Add Owner')}}</a>
        @endif
    </div>
    <div class="table-responsive">
        <table id="supplier-table" class="table">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th>{{trans('Name')}}</th>
                    <th>{{trans('Phone')}}</th>
                    <th>{{trans('Address')}}</th>
                    <th>{{trans('Balance')}}</th>
                    <th class="not-exported">{{trans('file.action')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($lims_owner_all as $key => $owner)
                <tr data-id="{{$owner->id}}">
                    <td>{{$key}}</td>
                    <td>{{$owner->name}}</td>
                    <td>{{$owner->phone}}</td>
                    <td>{{$owner->address}}</td>
                    <td>{{number_format($owner->balance,2)}}</td>
                    <td>
                        <div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{trans('file.action')}}
                                <span class="caret"></span>
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                @if(in_array("suppliers-edit", $all_permission))
                                <li>
                                	<a href="{{ route('owner.edit', $owner->id) }}" class="btn btn-link"><i class="dripicons-document-edit"></i> {{trans('file.edit')}}</a>
                                </li>
                                @endif
                                <li class="divider"></li>
                                <li>
                                	<a href="#" data-toggle="modal" data-target="#TransectionModel" data-id="{{$owner->id}}" class="btn btn-link"><i class="dripicons-document-money"></i> {{trans('Add Transection')}}</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                	<a href="#" data-toggle="modal" data-target="#TransectionListModel" data-id="{{$owner->id}}" class="btn btn-link"><i class="dripicons-document-money"></i> {{trans('Transection List')}}</a>
                                </li>
                                <li class="divider"></li>
                                @if(in_array("suppliers-delete", $all_permission))
                                {{ Form::open(['route' => ['owner.destroy', $owner->id], 'method' => 'DELETE'] ) }}
                                <li>
                                    <button type="submit" class="btn btn-link" onclick="return confirmDelete()"><i class="dripicons-trash"></i> {{trans('file.delete')}}</button>
                                </li>
                                {{ Form::close() }}
                                @endif
                            </ul>
                        </div>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</section>

<div id="TransectioneditModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
      <div class="modal-content">
        {!! Form::open(['route' => 'owner.transection', 'method' => 'post']) !!}
        <div class="modal-header">
          <h5 id="exampleModalLabel" class="modal-title">{{trans('Owner Transection')}}</h5>
          <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
        </div>
        <div class="modal-body">
          <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
          <div class="row">
            <div class="form-group col-md-6">
                <label>{{trans('file.Date')}} *</label>
                <input type="date" name="date"id="date" value="{{date('Y-m-d')}}" class="form-control" required>
            </div>
            <div class="form-group col-md-6">
                <input type="hidden" name="owner_id" id="owner_id">
                <label>{{trans('Transection Type')}} *</label>
                <select name="type" id="type" class="form-control" required data-live-search="true" title="Select Type">
                    <option value="0">Deposit</option>
                    <option value="1">Withdraw</option>
                </select>
            </div>
            <div class="form-group col-md-6">
                <label>{{trans('Amount Type')}} *</label>
                <select name="amount_type" id="amount_type" class="form-control" required data-live-search="true" title="Select Amount Type">
                    <option value="0">Bank</option>
                    <option value="1">Cash</option>
                </select>
            </div>
            @php
                $bank = App\Bank::where('is_active',1)->get();
            @endphp
            <div class="form-group col-md-6" id="bank_account_section" style="display:none">
                <label>{{trans('Bank Account')}} * <span id="balance_text"></span></label>
                <select name="bank_id" id="bank_id" class="form-control" required data-live-search="true" title="Select Bank">
                    @foreach($bank as $key=>$bank)
                        <option value="{{$bank->id}}" {{$key==0 ? 'selected':''}}>{{$bank->name}} [{{$bank->account_no}}]</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group col-md-6">
                <input type="hidden" id="max_withdraw">
                <label>{{trans('file.Amount')}} * </label>
                <input type="text" name="amount" id="amount" class="form-control" required>
            </div>
            <div class="form-group col-md-12">
                <label>{{trans('file.Note')}}</label>
                <textarea name="note" rows="4" class="form-control"></textarea>
            </div>
            <input type="submit" value="{{trans('file.submit')}}" class="btn btn-primary ml-3" id="submit-button">
        </div>
        </div>
        {!! Form::close() !!}
      </div>
    </div>
</div>
<div id="TransectionModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
      <div class="modal-content">
        {!! Form::open(['route' => 'owner.transection', 'method' => 'post']) !!}
        <div class="modal-header">
          <h5 id="exampleModalLabel" class="modal-title">{{trans('Owner Transection')}}</h5>
          <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
        </div>
        <div class="modal-body">
          <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
          <div class="row">
            <div class="form-group col-md-6">
                <label>{{trans('file.Date')}} *</label>
                <input type="date" name="date"id="date" value="{{date('Y-m-d')}}" class="form-control" required>
            </div>
            <div class="form-group col-md-6">
                <input type="hidden" name="owner_id" id="owner_id">
                <label>{{trans('Transection Type')}} *</label>
                <select name="type" id="type" class="form-control" required data-live-search="true" title="Select Type">
                    <option value="0">Deposit</option>
                    <option value="1">Withdraw</option>
                </select>
            </div>
            <div class="form-group col-md-6">
                <label>{{trans('Amount Type')}} *</label>
                <select name="amount_type" id="amount_type" class="form-control" required data-live-search="true" title="Select Amount Type">
                    <option value="0">Bank</option>
                    <option value="1">Cash</option>
                </select>
            </div>
            @php
                $bank = App\Bank::where('is_active',1)->get();
            @endphp
            <div class="form-group col-md-6" id="bank_account_section" style="display:none">
                <label>{{trans('Bank Account')}} * <span id="balance_text"></span></label>
                <select name="bank_id" id="bank_id" class="form-control" required data-live-search="true" title="Select Bank">
                    @foreach($bank as $key=>$bank)
                        <option value="{{$bank->id}}" {{$key==0 ? 'selected':''}}>{{$bank->name}} [{{$bank->account_no}}]</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group col-md-6">
                <input type="hidden" id="max_withdraw">
                <label>{{trans('file.Amount')}} * </label>
                <input type="text" name="amount" id="amount" class="form-control" required>
            </div>
            <div class="form-group col-md-12">
                <label>{{trans('file.Note')}}</label>
                <textarea name="note" rows="4" class="form-control"></textarea>
            </div>
            <input type="submit" value="{{trans('file.submit')}}" class="btn btn-primary ml-3" id="submit-button">
        </div>
        </div>
        {!! Form::close() !!}
      </div>
    </div>
</div>

<div id="TransectionListModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
	<div role="document" class="modal-dialog">
	  <div class="modal-content">
	    <div class="modal-header">
	      <h5 id="exampleModalLabel" class="modal-title">{{trans('Transection List')}}</h5>
	      <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
	    </div>
	    <div class="modal-body">
	      <table class="table table-striped">
	          <thead>
	              <tr>
	                  <th>Date</th>
	                  <th>Transection Type</th>
	                  <th>Bank/Cash</th>
	                  <th>Amount</th>
	                  <th>Note</th>
	                  <th>Action</th>
	              </tr>
	          </thead>
	          <tbody id="owner_transection_list">
	              
	          </tbody>
	      </table>
		</div>
	  </div>
	</div>
</div>

@php
    $balance = App\Bank::where('is_active',1)->first()->balance;
@endphp
@endsection

@push('scripts')
<script type="text/javascript">

    $("ul#owner_menu").siblings('a').attr('aria-expanded','true');
    $("ul#owner_menu").addClass("show");
    $("ul#owner_menu #owner-list-menu").addClass("active");

    var all_permission = <?php echo json_encode($all_permission) ?>;
    var supplier_id = [];
    var user_verified = <?php echo json_encode(env('USER_VERIFIED')) ?>;
    var bank_balance = @json($balance);
    
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    $(document).ready(function() {
        $('#TransectionModel').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var owner_id = button.data('id'); // Get the data-id attribute from the button
            $('#owner_id').val(owner_id);
        });
        
        $('#TransectionListModel').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var owner_id = button.data('id'); // Get the data-id attribute from the button
            $.get("/owner/transectionlist/"+owner_id, function (data) {
                console.log(data);
                $('#owner_transection_list').html(null);
                $.each(data, function(index, item) {
                    var id = item.id;
                    console.log(id);
                    $('#owner_transection_list').append(`
                        <tr>
                            <td>${item.created_at.split('T')[0]}</td>
                            <td>${item.type == 1 ? 'Withdraw':'Deposite'}</td>
                            <td>${item.amount_type == 0 ? 'Bank':'Cash'}</td>
                            <td>${item.amount}</td>
                            <td>${item.note ?? ''}</td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{trans('file.action')}}
                                        <span class="caret"></span>
                                        <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                        <li>
                                        	<a href="#" data-toggle="modal" data-target="#TransectioneditModel" data-id="1" class="btn btn-link"><i class="dripicons-document-edit"></i> {{trans('file.edit')}}</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li>
                                            <a href="{{route('owner.edit',1)}}" class="btn btn-link" onclick="return confirmDelete()"><i class="dripicons-trash"></i> {{trans('file.delete')}}</a>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    `)
                });
            });
        });
        $('#amount_type').on('change', function() {
            amountChange();
        });
        $('#type').on('change', function() {
            amountChange();
        });
        $('#bank_id').on('change', function() {
            amountChange();
        });
        
        $('#amount').on('input', function() {
            var type = parseInt($('#type').val());
            var amount = parseFloat($(this).val());
            var max = parseFloat($('#max_withdraw').val());
            if(type == 1){
                if(amount > max){
                    alert('Out of Account Balance');
                    var amount = $(this).val(max);
                }
            }
        });
    });
    function amountChange(){
        var amount_type = parseInt($('#amount_type').val());
        var type = parseInt($('#type').val());
        var bank_id = $('#bank_id').val();
        if(type == 0 || type == 1){
            if (amount_type === 0) {
                $('#bank_account_section').css('display', 'block');
                if(type == 1){
                    $.get("/owner/balance/"+bank_id, function (data) {
                        $('#balance_text').html(`Your balance is ${data}`);
                        $('#max_withdraw').val(data);
                    });
                }else{
                    $('#balance_text').html(null);
                }
            } else {
                $('#bank_account_section').css('display', 'none');
            }
        }else{
            alert('Select Type first Deposit or Withdraw');
        }
        $('#amount').val(0);
    }

	function confirmDelete() {
	    if (confirm("Are you sure want to delete?")) {
	        return true;
	    }
	    return false;
	}

    $('#supplier-table').DataTable( {
        "order": [],
        'language': {
            'lengthMenu': '_MENU_ {{trans("file.records per page")}}',
             "info":      '<small>{{trans("file.Showing")}} _START_ - _END_ (_TOTAL_)</small>',
            "search":  '{{trans("file.Search")}}',
            'paginate': {
                    'previous': '<i class="dripicons-chevron-left"></i>',
                    'next': '<i class="dripicons-chevron-right"></i>'
            }
        },
        'columnDefs': [
            {
                "orderable": false,
                'targets': [0, 1, 2, 3]
            },
            {
                'checkboxes': {
                   'selectRow': true
                },
                'targets': 0
            }
        ],
        'select': { style: 'multi',  selector: 'td:first-child'},
        'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "All"]],
        dom: '<"row"lfB>rtip',
        buttons: [
            {
                extend: 'pdf',
                text: '<i title="export to pdf" class="fa fa-file-pdf-o"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible',
                    stripHtml: false
                },
                customize: function(doc) {
                    for (var i = 1; i < doc.content[1].table.body.length; i++) {
                        if (doc.content[1].table.body[i][0].text.indexOf('<img src=') !== -1) {
                            var imagehtml = doc.content[1].table.body[i][0].text;
                            var regex = /<img.*?src=['"](.*?)['"]/;
                            var src = regex.exec(imagehtml)[1];
                            var tempImage = new Image();
                            tempImage.src = src;
                            var canvas = document.createElement("canvas");
                            canvas.width = tempImage.width;
                            canvas.height = tempImage.height;
                            var ctx = canvas.getContext("2d");
                            ctx.drawImage(tempImage, 0, 0);
                            var imagedata = canvas.toDataURL("image/png");
                            delete doc.content[1].table.body[i][0].text;
                            doc.content[1].table.body[i][0].image = imagedata;
                            doc.content[1].table.body[i][0].fit = [30, 30];
                        }
                    }
                },
            },
            {
                extend: 'excel',
                text: '<i title="export to excel" class="dripicons-document-new"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible',
                    format: {
                        body: function ( data, row, column, node ) {
                            if (column === 0 && (data.indexOf('<img src=') !== -1)) {
                                var regex = /<img.*?src=['"](.*?)['"]/;
                                data = regex.exec(data)[1];
                            }
                            return data;
                        }
                    }
                },
            },
            {
                extend: 'csv',
                text: '<i title="export to csv" class="fa fa-file-text-o"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible',
                    format: {
                        body: function ( data, row, column, node ) {
                            if (column === 0 && (data.indexOf('<img src=') !== -1)) {
                                var regex = /<img.*?src=['"](.*?)['"]/;
                                data = regex.exec(data)[1];
                            }
                            return data;
                        }
                    }
                },
            },
            {
                extend: 'print',
                text: '<i title="print" class="fa fa-print"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible',
                    stripHtml: false
                },
            },
            {
                text: '<i title="delete" class="dripicons-cross"></i>',
                className: 'buttons-delete',
                action: function ( e, dt, node, config ) {
                    if(user_verified == '1') {
                        supplier_id.length = 0;
                        $(':checkbox:checked').each(function(i){
                            if(i){
                                supplier_id[i-1] = $(this).closest('tr').data('id');
                            }
                        });
                        if(supplier_id.length && confirm("Are you sure want to delete?")) {
                            $.ajax({
                                type:'POST',
                                url:'supplier/deletebyselection',
                                data:{
                                    supplierIdArray: supplier_id
                                },
                                success:function(data){
                                    alert(data);
                                }
                            });
                            dt.rows({ page: 'current', selected: true }).remove().draw(false);
                        }
                        else if(!supplier_id.length)
                            alert('No supplier is selected!');
                    }
                    else
                        alert('This feature is disable for demo!');
                }
            },
            {
                extend: 'colvis',
                text: '<i title="column visibility" class="fa fa-eye"></i>',
                columns: ':gt(0)'
            },
        ],
    } );

    if(all_permission.indexOf("suppliers-delete") == -1)
        $('.buttons-delete').addClass('d-none');

</script>
@endpush
