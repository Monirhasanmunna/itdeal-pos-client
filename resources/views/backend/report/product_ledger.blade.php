@extends('backend.layout.main') @section('content')
  <div class="container-fluid">

    <div class="card mt-4">
      <div class="card-body">


        <form>
          <div class="row">
            <div class="col-md-3">
              <div class="form-group">
                <label for="start_date" class="form-label">{{ __('Start date') }}</label>
                <input type="date" value="{{ $start_date ?? null }}" name="start_date" id="start_date"
                  class="form-control">
              </div>
            </div>
            <div class="col-md-3">
              <div class="form-group">
                <label for="start_date" class="form-label">{{ __('Start date') }}</label>
                <input type="date" name="end_date" id="end_date" class="form-control" value="{{ $end_date ?? null }}">
              </div>
            </div>
            <div class="col-md-3">
              <button type="submit" class="btn btn-primary text-light mt-4"
                style="margin-top: 31px !important;">{{ __('Submit') }}</button>

              @if ($start_date || $end_date)
                <a href="{{ route('report.product_ledger') }}" class="btn btn-danger"
                  style="margin-top: 31px !important;">Clear Search</a>
              @endif
            </div>
          </div>
        </form>
      </div>
    </div>

    <div class="card mt-4">
      <div class="card-header text-center">
        <h1 style="font-size: 2rem; margin-bottom: 12px !important;">{{ __('Product Report') }}</h1>
        <h3>Date: {{ date('d/m/Y', strtotime($start_date)) }} to
          {{ date('d/m/Y', strtotime($end_date)) }}</h3>
      </div>
      <div class="card-body">

        <table class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th>{{ __('SL') }}</th>
                <th>{{ __('Product') }}</th>
                <th>{{ __('Opening Stock') }}</th>
                <th>{{ __('Purchase Qty') }}</th>
                <th>{{ __('Sale Qty') }}</th>
                <th>{{ __('Return Qty') }}</th>
                <th>{{ __('Adjustment+') }}</th>
                <th>{{ __('Adjustment-') }}</th>
                <th>{{ __('Closing Stock') }}</th>
                <th>{{ __('Stock Price') }}</th>
              </tr>
            </thead>
            <tbody>
              @php
                $total_opening_stock = 0;
                $total_purchase_qty = 0;
                $total_sale_qty = 0;
                $total_return_qty = 0;
                $total_adjustment_plus = 0;
                $total_adjustment_minus = 0;
                $total_closing_stock = 0;
                $total_stock_price = 0;
              @endphp
              @foreach ($products as $product)
                <tr>
                  <td>{{ $loop->iteration }}</td>
                  <td>{{ $product->name }}</td>
                  <td>{{ $product->opening_stock }}</td>
                  <td>{{ $product->purchase_qty }}</td>
                  <td>{{ $product->sale_qty }}</td>
                  <td>{{ $product->return_qty }}</td>
                  <td>{{ $product->adjustment_plus }}</td>
                  <td>{{ $product->adjustment_minus }}</td>
                  <td>{{ $product->closing_stock }}</td>
                  <td>{{ $product->stock_price }}</td>
                  @php
                    $total_opening_stock += $product->opening_stock;
                    $total_purchase_qty += $product->purchase_qty;
                    $total_sale_qty += $product->sale_qty;
                    $total_return_qty += $product->return_qty;
                    $total_adjustment_plus += $product->adjustment_plus;
                    $total_adjustment_minus += $product->adjustment_minus;
                    $total_closing_stock += $product->closing_stock;
                    $total_stock_price += $product->stock_price;
                  @endphp
                </tr>
              @endforeach
            </tbody>
            <tfoot>
              <tr>
                <td colspan="2">{{ __('Total') }}</td>
                <td>{{ $total_opening_stock }}</td>
                <td>{{ $total_purchase_qty }}</td>
                <td>{{ $total_sale_qty }}</td>
                <td>{{ $total_return_qty }}</td>
                <td>{{ $total_adjustment_plus }}</td>
                <td>{{ $total_adjustment_minus }}</td>
                <td>{{ $total_closing_stock }}</td>
                <td>{{ $total_stock_price }}</td>
              </tr>
            </tfoot>
          </table>
        </table>
      </div>
    </div>

  </div>
@endsection
@push('scripts')
  <script type="text/javascript"></script>
@endpush
