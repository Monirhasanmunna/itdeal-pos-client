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
                <label for="end_date" class="form-label">{{ __('End date') }}</label>
                <input type="date" value="{{ $end_date ?? null }}" name="end_date" id="end_date" class="form-control">
              </div>
            </div>

            <div class="col-md-3">
              <div class="form-group">
                <label for="start_date" class="form-label">{{ __('Product') }}</label>
                <select name="product_id" id="product_id" class="form-control selectpicker" data-live-search="true">
                  <option value="">{{ __('Select a product') }}</option>
                  @foreach ($products as $product)
                    <option {{ request()->product_id == $product->id ? 'selected' : '' }} value="{{ $product->id }}">
                      {{ $product->name }}</option>
                  @endforeach
                </select>
              </div>
            </div>
            <div class="col-md-3">
              <button type="submit" class="btn btn-primary text-light mt-4"
                style="margin-top: 14px !important;">{{ __('Submit') }}</button>

              @if ($start_date || $end_date)
                <a href="{{ route('report.customer_ledger') }}" class="btn btn-danger"
                  style="margin-top: 14px !important;">Clear Search</a>
              @endif
            </div>
          </div>
        </form>
      </div>
    </div>

    <div class="card mt-4">
      <div class="card-header text-center">
        <h1 style="font-size: 2rem; margin-bottom: 12px !important;">{{ __('Product wise customers sales') }}</h1>
        <h3>Date: {{ date('d/m/Y', strtotime($start_date)) }} to
          {{ date('d/m/Y', strtotime($end_date)) }}</h3>
      </div>
      <div class="card-body">
        <table class="table">
          <thead>
            <tr>
              <th>{{ __('SL') }}</th>
              <th>{{ __('Customer') }}</th>
              <th>{{ __('Qty') }}</th>
              <th>{{ __('Price') }}</th>
            </tr>
          </thead>
          <tbody>
            @php
              $total_qty = 0;
              $total_price = 0;
            @endphp
            @foreach ($customers as $customer)
              <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $customer->name }}</td>
                <td>{{ round($customer->sale_qty, 2) }}</td>
                <td>{{ $customer->sale_price }}</td>
                @php
                  $total_qty += round($customer->sale_qty, 2);
                  $total_price += round($customer->sale_price, 2);
                @endphp
              </tr>
            @endforeach
          </tbody>
          <tfoot>
            <tr>
              <th colspan="2">{{ __('Total') }}</th>
              <td>{{ $total_qty }}</td>
              <td>{{ $total_price }} Tk</td>
            </tr>
          </tfoot>
        </table>
      </div>
    </div>

  </div>
@endsection
@push('scripts')
  <script type="text/javascript"></script>
@endpush
