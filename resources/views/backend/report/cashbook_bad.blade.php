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
        <h1 style="font-size: 2rem; margin-bottom: 12px !important;">{{ __('Cashbook') }}</h1>
        <h3>Date: {{ date('d/m/Y', strtotime($start_date)) }} to
          {{ date('d/m/Y', strtotime($end_date)) }}</h3>
      </div>
      <div class="card-body">

        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th class="text-center" colspan="2">{{ __('Debit') }}</th>
                <th class="text-center" colspan="2">{{ __('Credit') }}</th>
              </tr>
              <tr>
                <th>{{ __('Particular') }}</th>
                <th>{{ __('Cash') }}</th>
                <th>{{ __('Particular') }}</th>
                <th>{{ __('Cash') }}</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>{{ __('Balance B/D') }}</td>
                <td>{{ $opening_balance }}</td>
                <td>{{ __('Purchase Paid Amount') }}</td>
                <td>{{ $total_purchase_paid_amount }}</td>
              </tr>

              {{-- Hide these: I need only cash things --}}
              {{-- <tr>
                <td>{{ __('Total Sale Amount') }}</td>
                <td>{{ $total_sale_amount }}</td>
                <td>{{ __('Total Purchase Amount') }}</td>
                <td>{{ $total_purchase_amount }}</td>
              </tr> --}}

              <tr>
                <td>{{ __('Sale Paid Amount') }}</td>
                <td>{{ $total_sale_paid_amount }}</td>
                <td>{{ __('Sale Return Amount') }}</td>
                <td>{{ $sale_return_amount }}</td>
              </tr>
              <tr>
                <td>{{ __('Previous Due Collection') }}</td>
                <td>{{ $previous_due_collection }}</td>
                <td>{{ __('Expense Amount') }}</td>
                <td>{{ $expense_amount }}</td>
              </tr>
              <tr>
                <td></td>
                <td></td>
                <td>Balance C/D ({{ date('d/m/Y', strtotime($end_date)) }})</td>
                <td>{{ $balance_cd }}</td>
              </tr>
              <tr>
                <td>Total</td>
                <td>{{ $total_debit }}</td>
                <td>Total</td>
                <td>{{ $total_credit + $balance_cd }}</td>
              </tr>
              <tr>
                <td>Balance B/D ({{ date('d/m/Y', strtotime($next_date)) }})</td>
                <td>{{ $balance_cd }}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

  </div>
@endsection
@push('scripts')
  <script type="text/javascript"></script>
@endpush
