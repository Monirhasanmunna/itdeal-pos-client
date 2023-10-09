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
              <button type="submit" class="btn btn-primary text-light mt-4"
                style="margin-top: 31px !important;">{{ __('Submit') }}</button>

              @if ($start_date || $end_date)
                <a href="{{ route('report.customer_ledger') }}" class="btn btn-danger"
                  style="margin-top: 31px !important;">Clear Search</a>
              @endif
            </div>
          </div>
        </form>
      </div>
    </div>

    <div class="card mt-4">
      <div class="card-header text-center">
        <h1 style="font-size: 2rem; margin-bottom: 12px !important;">{{ __('Customer Ledger') }}</h1>
        <h3>Date: {{ date('d/m/Y', strtotime($start_date)) }} to
          {{ date('d/m/Y', strtotime($end_date)) }}</h3>
      </div>
      <div class="card-body">
        <table class="table">
          <thead>
            <tr>
              <th>{{ __('Date') }}</th>
              <th>{{ __('Particular') }}</th>
              <th>{{ __('Debit') }}</th>
              <th>{{ __('Credit') }}</th>
              <th>{{ __('Balance') }}</th>
            </tr>
          </thead>
          <tbody>
            @php
              $total_debit = 0;
              $total_credit = 0;
              $balance = 0;
            @endphp
            @foreach ($items as $item)
              <tr>
                @php
                  if ($item->type == 'debit') {
                      $total_debit += $item->amount;
                      $balance += $item->amount;
                  } else {
                      $total_credit += $item->amount;
                      $balance -= $item->amount;
                  }
                @endphp
                <td>{{ date('d/m/Y', strtotime($item->created_at)) }}</td>
                <td>{{ $item->particular }}</td>
                <td>{{ $item->type == 'debit' ? $item->amount : 0 }}</td>
                <td>{{ $item->type == 'credit' ? $item->amount : 0 }}</td>
                <td>{{ $balance }}</td>
              </tr>
            @endforeach
          <tfoot>
            <tr>
              <td colspan="2">Total</td>
              <td>{{ $total_debit }}</td>
              <td>{{ $total_credit }}</td>
              <td>{{ $balance }}</td>
            </tr>
          </tfoot>
          </tbody>
        </table>
      </div>
    </div>

  </div>
@endsection
@push('scripts')
  <script type="text/javascript"></script>
@endpush
