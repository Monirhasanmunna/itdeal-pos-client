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
              <div class="form-group">
                <label for="start_date" class="form-label">{{ __('Customer') }}</label>
                <select name="customer_id" id="customer_id" class="form-control selectpicker" data-live-search="true">
                  <option value="">{{ __('Select a customer') }}</option>
                  @foreach ($customers as $customer)
                    <option {{ request()->customer_id == $customer->id ? 'selected' : '' }} value="{{ $customer->id }}">
                      {{ $customer->name }}</option>
                  @endforeach
                </select>
              </div>
            </div>
            <div class="col-md-3">

            </div>
            <div class="col-md-3">
              <button type="submit" class="btn btn-primary text-light mt-4"
                style="margin-top: 14px !important;">{{ __('Submit') }}</button>

              @if ($start_date || $end_date)
                <a href="{{ route('report.customer_product') }}" class="btn btn-danger"
                  style="margin-top: 14px !important;">Clear Search</a>
              @endif
            </div>
          </div>
        </form>
      </div>
    </div>

    <div class="card mt-4">
      <div class="card-header text-center">
        <h1 style="font-size: 2rem; margin-bottom: 12px !important;">{{ __('Customer wise products sales') }}</h1>
        <h3>Date: {{ date('d/m/Y', strtotime($start_date)) }} to
          {{ date('d/m/Y', strtotime($end_date)) }}</h3>
      </div>
      <div class="card-body">
        <table class="table">
          <thead>
            <tr>
              <th>{{ __('SL') }}</th>
              <th>{{ __('Product') }}</th>
              <th>{{ __('Qty') }}</th>
              <th>{{ __('Price') }}</th>
            </tr>
          </thead>
          <tbody>
            @php
              $total_qty = 0;
              $total_price = 0;
            @endphp
            @foreach ($products as $product)
              <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $product->name }}</td>
                <td>{{ round($product->sale_qty, 2) }}</td>
                <td>{{ $product->sale_price }}</td>
                @php
                    $total_qty += round($product->qty, 2);
                    $total_price += round($product->sale_price, 2);
                @endphp
              </tr>
            @endforeach
          </tbody>
          <tfoot>
            <tr>
              <th class="text-end text-right" colspan="3">{{ __('Total') }}</th>
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
